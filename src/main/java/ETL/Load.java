package ETL;

import Bean.Configuration;
import Bean.Dmart;
import Bean.Log;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.util.*;
import java.util.stream.Collectors;

public class Load {
    private static Configuration getConfig(String currentStatus){
        Optional<Configuration> configDetail = JDBIConnector.get("db1").withHandle(handle -> handle.createQuery("SELECT * FROM configurations INNER JOIN log ON configurations.id = log.configuration_id WHERE log.status = ?")
                .bind(0, currentStatus)
                .mapToBean(Configuration.class)
                .findFirst());
        return configDetail.orElse(null);
    }
    private static List<Log> getListLog() {
        List<Log> listLog = JDBIConnector.get("db1").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM log")
                    .mapToBean(Log.class).stream().collect(Collectors.toList());
        });
        return listLog;
    }
    private static void updateStatusInDatabase(int configurationId, String newStatus){
        JDBIConnector.get("db1").withHandle(handle -> {
            handle.createUpdate("UPDATE log SET status = ? FROM log INNER JOIN configurations ON log.configuration_id = configurations.id WHERE configurations.id = ?")
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
    public static List<Dmart> getListFirstDmartMN() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' LIMIT 18;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListSecondDmartMN() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' LIMIT 18 OFFSET 18;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListThirdDmartMN() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' LIMIT 18 OFFSET 36;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListFourthDmartMN() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' LIMIT 18 OFFSET 54;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListFirstDmartMT() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' LIMIT 18;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListSecondDmartMT() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' LIMIT 18 OFFSET 18;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListThirdDmartMT() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' LIMIT 18 OFFSET 36;")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListDmartMB() {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Bắc';")
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }

    public static String getProvince(List<Dmart> listDmart) {
        Dmart dmart = new Dmart(listDmart);
        String result = "";
        if(!(dmart.getListProvince() == null)) {
            result = dmart.getListProvince().get(0).replaceAll("\\[|\\]", "");
        }
        return result;
    }
    public static String getCurrentDate(){
        Optional<Dmart> lastestDmart = JDBIConnector.get("db4").withHandle(handle -> handle.createQuery("SELECT * FROM data ORDER BY `date` DESC LIMIT 1")
                .mapToBean(Dmart.class)
                .findFirst());
        String result = lastestDmart.get().getDate();
        return result;
    }
    public static String getNumberWinning(String giai, List<Dmart> listDmart) {
        Dmart dmart = new Dmart(listDmart);
        List<String> results = new ArrayList<>();

        switch (giai) {
            case "tam":
                results = dmart.getNumberWinningByPrize("Giải tám");
                break;
            case "bay":
                results = dmart.getNumberWinningByPrize("Giải bảy");
                break;
            case "sau1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(0));
                break;
            case "sau2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(1));
                break;
            case "sau3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(2));
                break;
            case "nam":
                results = dmart.getNumberWinningByPrize("Giải năm");
                break;
            case "bon1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(0));
                break;
            case "bon2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(1));
                break;
            case "bon3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(2));
                break;
            case "bon4":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(3));
                break;
            case "bon5":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(4));
                break;
            case "bon6":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(5));
                break;
            case "bon7":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(6));
                break;
            case "ba1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(0));
                break;
            case "ba2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(1));
                break;
            case "nhi":
                results = dmart.getNumberWinningByPrize("Giải nhì");
                break;
            case "nhat":
                results = dmart.getNumberWinningByPrize("Giải nhất");
                break;
            case "db":
                results = dmart.getNumberWinningByPrize("Giải đặc biệt");
                break;
            default:
                break;
        }
        return results.toString().replaceAll("\\[|\\]", "");
    }
    public static String getNumberWinningMB(String giai, List<Dmart> listDmart) {
        Dmart dmart = new Dmart(listDmart);
        List<String> results = new ArrayList<>();

        switch (giai) {
            case "bay1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải bảy").get(0));
                break;
            case "bay2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải bảy").get(1));
                break;
            case "bay3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải bảy").get(2));
                break;
            case "bay4":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải bảy").get(3));
                break;
            case "sau1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(0));
                break;
            case "sau2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(1));
                break;
            case "sau3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải sáu").get(2));
                break;
            case "nam1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(0));
                break;
            case "nam2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(1));
                break;
            case "nam3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(2));
                break;
            case "nam4":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(3));
                break;
            case "nam5":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(4));
                break;
            case "nam6":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải năm").get(5));
                break;
            case "bon1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(0));
                break;
            case "bon2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(1));
                break;
            case "bon3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(2));
                break;
            case "bon4":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải tư").get(3));
                break;
            case "ba1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(0));
                break;
            case "ba2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(1));
                break;
            case "ba3":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(2));
                break;
            case "ba4":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(3));
                break;
            case "ba5":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(4));
                break;
            case "ba6":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải ba").get(5));
                break;
            case "nhi1":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải nhì").get(0));
                break;
            case "nhi2":
                results = Collections.singletonList(dmart.getNumberWinningByPrize("Giải nhì").get(1));
                break;
            case "nhat":
                results = dmart.getNumberWinningByPrize("Giải nhất");
                break;
            case "db":
                results = dmart.getNumberWinningByPrize("Giải đặc biệt");
                break;
            default:
                break;
        }
        return results.toString().replaceAll("\\[|\\]", "");
    }

    private static void loadingAndUpdateConfig(){
        Handle staging = JDBIConnector.get("db2").open();
        Handle xoso_dw = JDBIConnector.get("db3").open();
        Handle controls = JDBIConnector.get("db1").open();
        try {
            // Kết nối với database dmarts
            Handle dmarts = JDBIConnector.get("db4").open();
            int idCurrentConfig = getConfig("TRANSFORMING").getId();
            if(dmarts == null) {
                // Thêm dữ liệu vào control.configurations với status = ERROR
                updateStatusInDatabase(idCurrentConfig, "ERROR");
                // Đóng kết nối với database xoso_dw
                xoso_dw.close();
            } else {
                // Load dữ liệu từ xoso_dw vào dmarts
                LoadFromXoso_dwToDmarts();
                updateStatusInDatabase(idCurrentConfig, "LOADING");
                // Kiểm tra nếu còn dòng có status = PREPARED
                for(Log log : getListLog())
                if(log.getStatus().equals("PREPARED")) {
                    CrawlData.CrawlDataToFile();
                } else {
                    //Nếu không còn dòng có status = PREPARED
                    updateStatusInDatabase(idCurrentConfig, "FINISH");
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
//        System.out.println(getListConfiguration());
//        loadingAndUpdateConfig();
//        System.out.println(getListSecondDmartMN());
//        System.out.println(Load.getProvince(getListThirdDmartMT()));
//        System.out.println(getCurrentDate());
//        System.out.println(getNumberWinning("sau2", getListFirstDmartMN()));
    }
}
