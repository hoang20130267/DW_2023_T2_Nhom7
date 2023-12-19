package ETL;

import Bean.*;
import DAO.ExportToExcel;
import DAO.Crawling;
import DAO.ReadConfigFile;
import DAO.SendEmail;
import db.ConnectToDB;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Extracting {
    public static void main(String[] args) throws ParseException {
        Crawling();
    }
    public static void Crawling() throws ParseException {
        // 2. Kết nối với database controls (controls.db)
        Handle controls = ConnectToDB.connectionToDB("controls").open();
        System.out.println("Cap nhat status = crawling");
        // 3. Kết nối thành công
        System.out.println("Ket noi thanh cong");
        if(controls != null) {
            // 3.1 Lấy các dòng có flag = true và status = PREPARE
            List<Configuration> configs = getConfig(controls);

            for (int i =0; i<configs.size(); i++ ) {
                // 4. Lấy 1 dòng Configuration
                Configuration config = configs.get(i);
                String status = controls.createQuery("SELECT status FROM logs WHERE configuration_id = :id")
                        .bind("id", config.getId())
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null);

                // 5. Kiểm tra status = ERROR và hết dòng chưa
                if(status == "ERROR" && i == configs.size()-1) {
                    // 30. Đóng kết nối database controls
                    controls.close();
                }
                LocalDate currentDate = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
                String formattedDate = currentDate.format(formatter);


                // 5.1 cập nhật status = CRAWLING
                controls.createUpdate("UPDATE logs SET status = 'CRAWLING', description='Cập nhật status thành công', " +
                                "date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();
                System.out.println("Cap nhat status = crawling");

                List<ProvinceResult> results = new ArrayList<>();
                results.addAll(Crawling.lotteryMN(config, controls));
                results.addAll(Crawling.lotteryMT(config, controls));
                results.addAll(Crawling.lotteryMB(config, controls));
                ExportToExcel.writeToFileCSV(controls,Crawling.getCurrentTime(),config,results, results.get(0).getDate());
                String fileName = results.get(0).getDate() + "_xoso.csv";
                String filePath = configs.get(i).getPath()+"/" + fileName;


                controls.createUpdate("UPDATE configurations SET `date` = ? WHERE id = ?")
                        .bind(0, Crawling.getCurrentTimeDB(results.get(0).getDate()))
                        .bind(1, config.getId())
                        .execute();
                //10. Thêm vào bảng control.log với status = EXTRACTING
                controls.createUpdate("UPDATE logs SET status = 'EXTRACTING', description='Cập nhật status thành công', " +
                                "date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();

                System.out.println("Cap nhat status = extracting");
            }
        } else {

            // 3.2 Gửi mail thông báo lỗi
            SendEmail.sendMailError("Kết nối với database controls thất bại");

        }
    }
    public static List<Configuration> getConfig(Handle handle) {
        try  {
            // Lấy tất cả các dòng có status = PREPARE và flag = true
            List<Configuration> result = handle.createQuery("SELECT c.* FROM configurations c " +
                            "JOIN logs l ON c.id = l.configuration_id " +
                            "WHERE l.status = 'PREPARED' AND c.flag = 1")
                    .mapToBean(Configuration.class)
                    .list();

            return result;


        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    private static void insertNewConfigAndLog(Handle handle, String path, String url, String username, String password) {
        int id = handle.createQuery("SELECT id FROM controls.configurations ORDER BY id DESC LIMIT 1")
                .mapTo(Integer.class)
                .one();

        int idLog = handle.createQuery("SELECT id FROM controls.logs ORDER BY id DESC LIMIT 1")
                .mapTo(Integer.class)
                .one();

        int newID = id + 1;
        int newLogId = idLog + 1;

        handle.createUpdate("INSERT INTO controls.configurations VALUES (?, '', ?, ?, ?, ?, 1);")
                .bind(0, newID)
                .bind(1, path)
                .bind(2, url)
                .bind(3, username)
                .bind(4, password)
                .execute();

        handle.createUpdate("INSERT INTO controls.logs VALUES (?, ?, '', '', 'PREPARED', current_date, '2026-12-31');")
                .bind(0, newLogId)
                .bind(1, newID)
                .execute();
    }


}


