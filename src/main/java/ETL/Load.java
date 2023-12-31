package ETL;

import Bean.Configuration;
import Bean.Dmart;
import Bean.Log;
import DAO.SendEmail;
import db.ConnectToDB;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import java.util.*;
import java.util.stream.Collectors;

public class Load {
    private static Configuration getConfig(String currentStatus){
        Optional<Configuration> configDetail = JDBIConnector.get("db1").withHandle(handle -> handle.createQuery("SELECT con.id, con.date, con.path, con.user_database, con.password_database, con.flag FROM controls.configurations con INNER JOIN controls.logs l ON con.id = l.configuration_id WHERE l.status = ? LIMIT 1")
                .bind(0, currentStatus)
                .mapToBean(Configuration.class)
                .findFirst());
        return configDetail.orElse(null);
    }
    private static List<Log> getListLog() {
        List<Log> listLog = JDBIConnector.get("db1").withHandle(handle -> {
            return handle.createQuery("SELECT l.id, l.configuration_id, l.file_name, l.description, l.status FROM controls.logs l INNER JOIN controls.configurations con ON con.id = l.configuration_id WHERE con.flag = 1")
                    .mapToBean(Log.class).stream().collect(Collectors.toList());
        });
        return listLog;
    }
    private static void updateStatusInDatabase(int configurationId, String newStatus){
        JDBIConnector.get("db1").withHandle(handle -> {
            handle.createUpdate("UPDATE controls.logs\n" +
                            "SET status = ?\n" +
                            "WHERE configuration_id = ?;")
                    .bind(0, newStatus)
                    .bind(1, configurationId).execute();
            return true;
        });
    }
    private static void insertNewConfigAndLog(){
        Integer id = JDBIConnector.get("db1").withHandle(handle -> {
            return handle.createQuery("SELECT id FROM controls.configurations ORDER BY id DESC LIMIT 1").mapTo(Integer.class).one();
        });
        Integer idLog = JDBIConnector.get("db1").withHandle(handle -> {
            return handle.createQuery("SELECT id FROM controls.logs ORDER BY id DESC LIMIT 1").mapTo(Integer.class).one();
        });
        int newID = id + 1 ;
        int newLogId = idLog + 1 ;
        JDBIConnector.get("db1").withHandle(handle -> {
            handle.createUpdate("INSERT INTO controls.configurations VALUES (?,'', 'D:/Data Warehouse/Data/','https://xosohomnay.com.vn', 'root', '', 1);").bind(0,newID).execute();
            handle.createUpdate("INSERT INTO controls.logs VALUES (?, ?, '', '','PREPARED', current_date, '2026-12-31');").bind(0, newLogId).bind(1, newID).execute();
            return true;
        });
    }
    private static void LoadFromXoso_dwToDmarts() {
        try (Handle handle = JDBIConnector.get("db3").open()) {
            handle.createUpdate("CALL xoso_dw.TransferDataFromXoso_dwToDmart;").execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    24. Hiển thị dữ liệu từ dmart lên UI
    public static List<Dmart> getListFirstDmartMN(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' AND date = ? LIMIT 18;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListSecondDmartMN(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' AND date = ? LIMIT 18 OFFSET 18;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListThirdDmartMN(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' AND date = ? LIMIT 18 OFFSET 36;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListFourthDmartMN(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Nam' AND date = ? LIMIT 18 OFFSET 54;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListFirstDmartMT(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' AND date = ? LIMIT 18;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListSecondDmartMT(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' AND date = ? LIMIT 18 OFFSET 18;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListThirdDmartMT(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Trung' AND date = ? LIMIT 18 OFFSET 36;").bind(0, date)
                    .mapToBean(Dmart.class).stream().collect(Collectors.toList());
        });
        return listDmartMN;
    }
    public static List<Dmart> getListDmartMB(String date) {
        List<Dmart> listDmartMN = JDBIConnector.get("db4").withHandle(handle -> {
            return handle.createQuery("SELECT * FROM data WHERE domain = 'Bắc' AND date = ?;").bind(0, date)
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
        Optional<Dmart> lastestDmart = JDBIConnector.get("db4").withHandle(handle -> handle.createQuery("SELECT `date` FROM data ORDER BY `date` DESC LIMIT 1")
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

    public static void loadingAndUpdateConfig(){
        Handle controls = ConnectToDB.connectionToDB("controls").open();
        Handle staging = ConnectToDB.connectionToDB("staging").open();
        Handle xoso_dw = ConnectToDB.connectionToDB("xoso_dw").open();

        // 21. Kết nối với database dmarts
        Handle dmart = ConnectToDB.connectionToDB("dmarts").open();
        try {
            int idCurrentConfig = getConfig("TRANSFORMING").getId();
            //22. Kết nối không thành công
            if(dmart == null) {
                // 22.2 Thêm dữ liệu vào control.log với status = ERROR
                updateStatusInDatabase(idCurrentConfig, "ERROR");
                // 23. Gửi email thông báo lỗi
                SendEmail.sendMailError("Kết nối Database dmarts không thành công!");
                // 28. Đóng kết nối với database xoso_dw
                xoso_dw.close();
                //29. Đóng kết nối với database Staging
                staging.close();
                //30. Đóng kết nối với database control
                controls.close();

                // 22. Kết nối dmart thành công
            } else {
                // 22.1 Load dữ liệu từ xoso_dw.xo_so_fact vào dmart.data
                LoadFromXoso_dwToDmarts();
                //23. Thêm vào bảng control.logs với status = LOADING
                updateStatusInDatabase(idCurrentConfig, "LOADING");

                for(Log log : getListLog()) {
                    //25. Kiểm tra nếu còn dòng có status = PREPARED và flag = 1 trong database controls
                    if (log.getStatus().equals("PREPARED")) {
                        // Quay lại bắt đầu bước 4
                        Extracting.Crawling();

                        //25. Nếu không còn dòng có status = PREPARED và flag = 1 trong database controls
                    } else {
                        //25.1 Thêm dữ liệu vào control.log với status = FINISH
                        updateStatusInDatabase(idCurrentConfig, "FINISH");
                        //26. Tạo config và log mới với status = PREPARED và flag = 1 trong control.db cho lần crawl tiếp theo
                        insertNewConfigAndLog();

                        //27. Đóng kết nối với database dmarts
                        dmart.close();
                        //28. Đóng kết nối với database xoso_dw
                        xoso_dw.close();
                        //29. Đóng kết nối với database Staging
                        staging.close();
                        //30. Đóng kết nối với database control
                        controls.close();
                        break;
                    }
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            }
        }
    public static void main(String[] args) {
//        System.out.println(getListConfiguration());
//        System.out.println(getListFirstDmartMN("12/10/2023"));
//        System.out.println(Load.getProvince(getListThirdDmartMT()));
//        System.out.println(getCurrentDate());
//        System.out.println(getNumberWinning("sau2", getListFirstDmartMN()));
//        System.out.println(getConfig("TRANSFORMING"));
//        updateStatusInDatabase(47, "EXTRACTING");
//        loadingAndUpdateConfig();
    }
}
