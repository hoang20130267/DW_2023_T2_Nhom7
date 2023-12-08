package ETL;

import Bean.Configuration;
import Bean.Staging;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Transform {
    public static void sendMailError(String content) {
        String fromEmail = "20130224@st.hcmuaf.edu.vn";
        String password = "";
        String toEmail = "nguyenhwdat1912@gmail.com";


        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        properties.put("mail.smtp.port", "587"); //TLS Port
        properties.put("mail.smtp.auth", "true"); //enable authentication
        properties.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject("Thông báo lỗi");
            message.setContent(content, "text/plain");
            System.out.println("Gửi mail thành công");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static Configuration getConfigurationStatus(String currentStatus) {
        Configuration getStatus = JDBIConnector.get("db1").withHandle(handle ->
                handle.createQuery("SELECT * FROM configurations INNER JOIN log ON configurations.id = log.configuration_id WHERE log.status = ?")
                        .bind(1, currentStatus)
                        .mapToBean(Configuration.class)
                        .findFirst()
                        .orElse(null));
        return getStatus;
    }

    public static void updateStatusInDB(int configurationID, String newStatus) {
        try{
            JDBIConnector.get("db1").withHandle(handle -> {
                handle.createUpdate("UPDATE log SET status = ? FROM log INNER JOIN configurations ON log.configuration_id = configurations.id WHERE configurations.id = ?")
                        .bind(1, newStatus)
                        .bind(2, configurationID);
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private static List<Staging> readLotteryDataFromCSV(String csvFile) {
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
                staging.setDate(data[4]);
                // Tính toán date_updated và date_expired
                staging.calculateDates();
                stagingList.add(staging);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stagingList;
    }

    public static void insertStagingDB(Handle handle, String path){
        try{
            String query = "INSERT INTO xo_so_stagging (prize, province, domain, number_winning, date, date_update, date_expired) VALUES (?, ?, ?, ?, ?, ?, ?)";
            List<Staging> stagingList = readLotteryDataFromCSV(path);
            for(Staging staging : stagingList){
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
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static boolean isNullOrEmpty(String value){
        return value == null || value.trim().isEmpty();
    }

    public static void transferStagingToXoso_dw(){
        try{
            JDBIConnector.get("db3").withHandle(handle -> {
                handle.createUpdate("CALL sp_transfer_data_and_update_ids();")
                        .execute();
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void truncateStagingDB(){
        try{
            JDBIConnector.get("db2").withHandle(handle -> {
                handle.createUpdate("TRUNCATE TABLE staging.xo_so_stagging")
                        .execute();
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateConfiguration() {
        try {
            Handle controls = JDBIConnector.get("db1").open();
            Handle staging = JDBIConnector.get("db2").open();
            Handle xoso_dw = JDBIConnector.get("db3").open();
            //Lấy ID của Configuration hiện tại
            int currentConfigID = getConfigurationStatus("EXTRACTING").getId();
            //Check kết nối db Staging
            if (staging == null) {
                updateStatusInDB(currentConfigID, "ERROR");
                sendMailError("Kết nối Database staging không thành công!");
                controls.close();
            } else {
                Configuration configuration = new Configuration();
                //Đọc dữ liệu từ
                insertStagingDB(staging, configuration.getPath());

                if (xoso_dw == null) {
                    sendMailError("Kết nối Database xoso_dw không thành công!");
                    updateStatusInDB(currentConfigID, "ERROR");
                    staging.close();
                    controls.close();
                } else {
                    //transform dữ liệu từ staging db sang xoso_dw
                    transferStagingToXoso_dw();
                    updateStatusInDB(currentConfigID, "TRANSFORMING");
                    //truncate dữ liệu trong bảng xo_so_stagging
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

    public static void main(String[] args) {
        updateConfiguration();
    }
}
