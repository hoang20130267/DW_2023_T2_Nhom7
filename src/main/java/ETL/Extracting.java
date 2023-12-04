package ETL;

import Bean.*;
import DAO.ExportToExcel;
import DAO.Crawling;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class Extracting {

    public static void main(String[] args) {
        Crawling();
    }
    public static void Crawling() {
        // Kết nối với database controls (controls.db)
        Handle controls = JDBIConnector.get("db1").open();

        if(controls.getConnection() != null) {
            // Lấy các dòng có flag = true và status = PREPARE
            List<Configuration> configs = getConfig(controls);
            for (int i =0; i<configs.size(); i++ ) {
                // Lấy 1 dòng Configuration
                Configuration config = configs.get(i);
                String status = controls.createQuery("SELECT status FROM log WHERE configuration_id = :id")
                        .bind("id", config.getId())
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null);


                // Kiểm tra status = ERROR và hết dòng chưa
                if(status == "ERROR" && i == configs.size()-1) {
                    controls.close();
                }
                // cập nhật status = CRAWLING
                controls.createUpdate("UPDATE log SET status = 'CRAWLING', description='Cập nhật status thành công', date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();
                // Xử lý dữ liệu
                ExportToExcel.writeDataToExcel(controls,Crawling.getCurrentTime(),config,Crawling.lotteryMN(config, controls), Crawling.lotteryMT(config, controls), Crawling.lotteryMB(config, controls), config.getdate());
                // Cập nhật status = EXTRACTING
                controls.createUpdate("UPDATE log SET status = 'EXTRACTING', description='Cập nhật status thành công', date_update = :currentTime WHERE configuration_id = :id")
                        .bind("currentTime", Crawling.getCurrentTime())
                        .bind("id", config.getId())
                        .execute();
            }
        } else {
            // Gửi mail
        }
    }


    public static List<Configuration> getConfig(Handle handle) {
        try  {
            // Lấy tất cả các dòng có status = PREPARE và flag = true
            List<Configuration> result = handle.createQuery("SELECT c.* FROM configurations c " +
                            "JOIN log l ON c.id = l.configuration_id " +
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


