package ETL;

import Bean.Configuration;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class Load {
    private static Configuration getConfiguration(String currentStatus){
        Optional<Configuration> configDetail = JDBIConnector.get("db1").withHandle(handle -> handle.createQuery("SELECT * FROM configurations WHERE status= ?")
                .bind(0, currentStatus)
                .mapToBean(Configuration.class)
                .findFirst());
        return configDetail.orElse(null);
    }
    private static List<Configuration> getListConfiguration() {
        List<Configuration> listConfig = JDBIConnector.get("db1").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM configurations")
                    .mapToBean(Configuration.class).stream().collect(Collectors.toList());
        });
        return listConfig;
    }
    private static void updateStatusInDatabase(int configurationId, String newStatus){
        JDBIConnector.get("db1").withHandle(handle -> {
            handle.createUpdate("UPDATE configurations SET status = ? WHERE id = ?")
                    .bind(1, newStatus)
                    .bind(2, configurationId);
            return true;
        });
    }
    private static void LoadFromXoso_dwToDmarts() {
        JDBIConnector.get("db3").withHandle(handle -> {
            handle.createUpdate("CALL TransferDataFromXoso_dwToDmart;").execute();
            return true;
        });
    }
    private static void loadingAndUpdateConfig(){
        Handle staging = JDBIConnector.get("db2").open();
        Handle xoso_dw = JDBIConnector.get("db3").open();
        Handle controls = JDBIConnector.get("db1").open();
        try {
            // Kết nối với database dmarts
            Handle dmarts = JDBIConnector.get("db4").open();
            if(dmarts == null) {
                // Thêm dữ liệu vào control.configurations với status = ERROR
                updateStatusInDatabase(getConfiguration("TRANSFORMING").getId(), "ERROR");
                // Đóng kết nối với database xoso_dw
                xoso_dw.close();
            } else {
                // Load dữ liệu từ xoso_dw vào dmarts
                LoadFromXoso_dwToDmarts();
                updateStatusInDatabase(getConfiguration("TRANSFORMING").getId(), "LOADING");
                // Kiểm tra nếu còn dòng có status = PREPARED
                for(Configuration config : getListConfiguration())
                if(config.getStatus().equals("PREPARED")) {
                    CrawlData.CrawlDataToFile();
                } else {
                    //Nếu không còn dòng có status = PREPARED
                    updateStatusInDatabase(getConfiguration("LOADING").getId(), "FINISH");
                    dmarts.close();
                    xoso_dw.close();
                    staging.close();
                    controls.close();
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            }
        }
    public static void main(String[] args) {
        System.out.println(getListConfiguration());
        loadingAndUpdateConfig();
    }
}
