package ETL;

import Bean.Configuration;
import Bean.Staging;
import DAO.Crawling;
import DAO.SendEmail;
import db.ConnectToDB;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class Transform {

    public static Configuration getConfigurationStatus(String currentStatus) {
        try (Handle handle = ConnectToDB.connectionToDB("controls", "root", "").open()) {
            Optional<Configuration> configDetail = handle.createQuery("SELECT con.id, con.date, con.path, con.user_database, con.password_database, con.flag FROM configurations con INNER JOIN logs l ON con.id = l.configuration_id WHERE l.status = :status LIMIT 1")
                    .bind("status", currentStatus)
                    .mapToBean(Configuration.class)
                    .findFirst();

            return configDetail.orElse(null);
        }
    }

    public static boolean updateStatusInDB(int configurationID, String newStatus) {
        // Cập nhật trạng thái mới
        try (Handle handle = ConnectToDB.connectionToDB("controls", "root", "").open()) {
            handle.createUpdate("UPDATE logs SET status = :newStatus WHERE configuration_id = :configurationID")
                    .bind("newStatus", newStatus)
                    .bind("configurationID", configurationID)
                    .execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private static List<Staging> readLotteryDataFromCSV(String csvFile) {
        //Lấy dữ liệu kết quả xổ số từ file csv
        List<Staging> stagingList = new ArrayList<>();
        String line;
        String csvSplitBy = ",";
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            br.readLine(); // Bỏ qua dòng tiêu đề

            while ((line = br.readLine()) != null) {

                String[] data = line.split(csvSplitBy);
                Staging staging = new Staging();
                staging.setPrize(data[0]);
                staging.setProvince(data[1]);
                staging.setDomain(data[2]);
                staging.setNumber_winning(data[3]);
                staging.setDate(Crawling.getCurrentTimeDB(data[4]));
                // Tính toán date_updated và date_expired
                staging.calculateDates();
                stagingList.add(staging);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return stagingList;
    }

    public static void insertStagingDB(Handle handle, String path){
        //Chèn dữ liệu từ file csv vào database staging
        try{
            String query = "INSERT INTO staging.xo_so_staging (prize, province, `domain`, number_winning, `date`, date_update, date_expired) VALUES (?, ?, ?, ?, ?, ?, ?)";
            //Gọi phương thức lấy dữ liệu từ file csv
            List<Staging> stagingList = readLotteryDataFromCSV(path);
            for(Staging staging : stagingList){
                // 14. Xoá dữ liệu bị rỗng
                //Kiểm tra dữ liệu số trúng thưởng và tỉnh có trống hay không
                //Nếu trống thì bỏ qua dòng đó
                if(isNullOrEmpty(staging.getNumber_winning()) || isNullOrEmpty(staging.getProvince())){
                    continue;
                }
                handle.createUpdate(query)
                        .bind(0, staging.getPrize())
                        .bind(1, staging.getProvince())
                        .bind(2, staging.getDomain())
                        .bind(3, staging.getNumber_winning())
                        .bind(4, staging.getDate())
                        .bind(5, staging.getDate_updated())
                        .bind(6, staging.getDate_expired())
                        .execute();
                System.out.println(staging.getDate());
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //Phương thức kiểm tra dữ liệu có rỗng hay không và trả về true false
    public static boolean isNullOrEmpty(String value){
        return value == null || value.trim().isEmpty();
    }

    public static void transferStagingToXoso_dw(){
        //Viết câu query update kết nối db3 gọi function chuyển đổi dữ liệu từ db staging vào xoso_dw theo id
        try{
            JDBIConnector.get("db3").withHandle(handle -> {
                handle.createUpdate("CALL xoso_dw.transfer_data_and_update_ids();")
                        .execute();
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void truncateStagingDB(){
        //Viết câu query update kết nối db2 xoá dữ liệu trong bảng xo_so_staging của db staging
        try{
            JDBIConnector.get("db2").withHandle(handle -> {
                handle.createUpdate("TRUNCATE TABLE staging.xo_so_staging")
                        .execute();
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateConfiguration() {
        try {
            // 11.Kết nối database staging
            Handle controls = ConnectToDB.connectionToDB("controls","root","").open();
            Handle staging = ConnectToDB.connectionToDB("staging","root","").open();

            //Lấy ID của Configuration hiện tại
            int currentConfigID = getConfigurationStatus("EXTRACTING").getId();
            System.out.println(currentConfigID);
            //Kiểm tra kết nối db Staging
            if (staging == null) {
                // 12.2 Thêm dữ liệu vào control.log với status = ERROR
                updateStatusInDB(currentConfigID, "ERROR");
                // 12.3 Gửi mail thông báo lỗi
                SendEmail.sendMailError("Kết nối Database staging không thành công!");
                controls.close();
                // 12. Kết nối thành công
            } else {
                // 12.1 Truy cập vào thư mục theo đường dẫn trong control.configuration để lấy ra file csv mới nhất
                String getFile = getFile(currentConfigID);
                // 13. Đọc file excel và thêm dữ liệu vào Staging.xo_so_staging
                insertStagingDB(staging, getFile);
                // 15. Thêm dữ liệu vào control.log với file_name = tên file và status = CLEANING
                updateStatusInDB(currentConfigID, "CLEANING");

                // 16. Kết nối với database xoso_dw(xoso_dw.db)
                Handle xoso_dw = ConnectToDB.connectionToDB("xoso_dw","root","").open();

                //Kiểm tra kết nối db xoso_dw
                if (xoso_dw == null) {
                    //17.2 Thêm dữ liệu vào control.log với status = ERROR
                    updateStatusInDB(currentConfigID, "ERROR");
                    // 17.3 Gửi mail thông báo lỗi
                    SendEmail.sendMailError("Kết nối Database xoso_dw không thành công!");
                    // 17.4 Đóng kết nối với database Staging
                    staging.close();
                    controls.close();
                } else {
                    // 17. Kết nối thành công
                    // 17.1 Chuyển đổi dữ liệu từ staging.xo_so_staging sang xoso_dw.xo_so_fact
                    // 18. Transform dữ liệu theo các bảng dim trong xoso_dw
                    transferStagingToXoso_dw();
                    // 19. Thêm dữ liệu vào control.log với status = TRANSFORMING
                    updateStatusInDB(currentConfigID, "TRANSFORMING");
                    // 20. Truncate bảng staging.xo_so_staging
                    truncateStagingDB();
                    controls.close();
                    staging.close();
                    xoso_dw.close();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String getFile(int id) {
        try (Handle handle = ConnectToDB.connectionToDB("controls", "root", "").open()) {
            String file = handle.createQuery("SELECT CONCAT(c.path, '/', l.file_name) AS full_path " +
                            "FROM configurations c " +
                            "JOIN logs l ON c.id = l.configuration_id WHERE c.id = ?")
                    .bind(0, id)  // Use positional parameter (index 0) for "id"
                    .mapTo(String.class)
                    .findOne()
                    .orElse(null);
            return file;
        }
    }



    public static void main(String[] args) {
        updateConfiguration();
    }
}
