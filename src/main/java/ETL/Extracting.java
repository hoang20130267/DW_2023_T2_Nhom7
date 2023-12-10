package ETL;

import Bean.*;
import DAO.ExportToExcel;
import DAO.Crawling;
import DAO.SendEmail;
import db.ConnectToDB;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.util.ArrayList;
import java.util.List;

public class Extracting {
    public static void main(String[] args) {
        Crawling();
    }
    public static void Crawling() {
        // Kết nối với database controls (controls.db)
        Handle controls = ConnectToDB.connectionToDB("controls","root","").open();

        System.out.println("Ket noi thanh cong");
        if(controls.getConnection() != null) {
            // Lấy các dòng có flag = true và status = PREPARE
            List<Configuration> configs = getConfig(controls);
            for (int i =0; i<configs.size(); i++ ) {
                // Lấy 1 dòng Configuration
                Configuration config = configs.get(i);
                String status = controls.createQuery("SELECT status FROM logs WHERE configuration_id = :id")
                        .bind("id", config.getId())
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null);
                // Kiểm tra status = ERROR và hết dòng chưa
                if(status == "ERROR" && i == configs.size()-1) {
                    controls.close();
                }
                // cập nhật status = CRAWLING
                controls.createUpdate("UPDATE logs SET status = 'CRAWLING', description='Cập nhật status thành công', date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();
                // Xử lý dữ liệu
                List<ProvinceResult> results = new ArrayList<>();
                results.addAll(Crawling.lotteryMN(config, controls));
                results.addAll(Crawling.lotteryMB(config, controls));
                results.addAll(Crawling.lotteryMT(config, controls));
                ExportToExcel.writeToFileCSV(controls,Crawling.getCurrentTime(),config,results, Crawling.getCurrentTimeFileName());
                // Cập nhật status = EXTRACTING
                controls.createUpdate("UPDATE logs SET status = 'EXTRACTING', description='Cập nhật status thành công', date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();
            }
        } else {
           // SendEmail.sendMailError("Kết nối với database controls thất bại");
            // Gửi mail
        }
    }
    public static List<Configuration> getConfig(Handle handle) {
        try  {
            // Lấy tất cả các dòng có status = PREPARE và flag = true
            List<Configuration> result = handle.createQuery("SELECT c.* FROM configurations c " +
                            "JOIN logs l ON c.id = l.configuration_id " +
                            "WHERE l.status = 'PREPARE' AND c.flag = 1")
                    .mapToBean(Configuration.class)
                    .list();

            return result;


        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


}


