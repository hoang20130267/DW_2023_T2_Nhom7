package ETL;

import Bean.Configuration;
import Bean.Staging;
import DAO.SendEmail;
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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Transform {

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
        JDBIConnector.get("db1").withHandle(handle -> {
            handle.createUpdate("UPDATE log SET status = ? FROM log INNER JOIN configurations ON log.configuration_id = configurations.id WHERE configurations.id = ?")
                    .bind(1, newStatus)
                    .bind(2, configurationID);
            return true;
        });
    }

    public static List<Staging> readCSV(String csvFile) {
        List<Staging> stagingList = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String line;
            // Bỏ qua dòng tiêu đề
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                Staging staging = new Staging();
                staging.setId(Integer.parseInt(data[0].trim()));
                staging.setPrize(data[1].trim());
                staging.setProvince(data[2].trim());
                staging.setDomain(data[3].trim());
                staging.setNumber_winning(data[4].trim());
                staging.setDate(data[5].trim());
                staging.setDate_update(data[6].trim());
                staging.setDate_expired(data[7].trim());
                stagingList.add(staging);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return stagingList;
    }

    public static void insertStagingDB(Staging staging, Handle handle) {
        handle.execute("INSERT INTO your_table_name (id, prize, province, domain, number_winning, date, date_update, date_expired) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                staging.getId(),
                staging.getPrize(),
                staging.getProvince(),
                staging.getDomain(),
                staging.getNumber_winning(),
                staging.getDate(),
                staging.getDate_update(),
                staging.getDate_expired());
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
                SendEmail.sendMailError("Kết nối Database staging không thành công!");
                controls.close();
            } else {
                //Đọc dữ file csv
                Configuration configuration = new Configuration();
                List<Staging> stagingList = readCSV(configuration.getPath());
                //Thêm data vào db Staging table xo_so_staging
                for (Staging stagings : stagingList) {
                    insertStagingDB(stagings, staging);
                }
//                code xoa du lieu rong
                if (xoso_dw == null) {
                    SendEmail.sendMailError("Kết nối Database xoso_dw không thành công!");
                    updateStatusInDB(currentConfigID, "ERROR");
                    staging.close();
                    controls.close();
                } else {
//                    code transform staging to dim of xosodw
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        List<Staging> stagingList = readCSV("/Users/hidroxit/Desktop/readFile/test.csv");
        for (Staging staging : stagingList) {
            System.out.println(staging);
        }
    }
}
