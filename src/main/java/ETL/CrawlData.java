package ETL;

import Bean.Configuration;
import Bean.LotteryResult;
import Bean.Prize;
import Bean.ProvinceResult;
import DAO.ExportToExcel;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CrawlData {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        // JDBC URL, username, and password for XAMPP MySQL
        CrawlDataToFile();
    }
    public static Connection connectDBConfiguration() {
        try {
            String url = "jdbc:mysql://localhost:3306/controls";
            String user = "root";
            String password = "";

            Connection connection = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Connecting to the database...");
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        }
        catch (Exception e) {
            // gửi mail
            return null;
        }
    }

    private static List<Configuration> performDatabaseOperations(Connection connection, String status) throws SQLException {
        String query = "SELECT * FROM configurations";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Configuration> configurations = new ArrayList<>();
            // Process the result set
            while (resultSet.next()) {
                Configuration configuration = new Configuration();
                configuration.setId(resultSet.getInt(1));
                configuration.setFile_name(resultSet.getString(2));
                configuration.setPath(resultSet.getString(3));
                configuration.setUrl(resultSet.getString(4));
                configuration.setUser_database(resultSet.getString(5));
                configuration.setPassword_database(resultSet.getString(6));
                configuration.setFlag(resultSet.getInt(7));
                configuration.setStatus(resultSet.getString(8));
                if(configuration.getFlag() ==1 && configuration.getStatus().equals(status)) {
                    configurations.add(configuration);
                }
            }

            return configurations;
        }

    }
    private static void updateStatusInDatabase(int configurationId, String newStatus) throws SQLException, ClassNotFoundException {
        String updateQuery = "UPDATE configurations SET status = ? WHERE id = ?";
        try (Connection connection = connectDBConfiguration();
             PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
            updateStatement.setString(1, newStatus);
            updateStatement.setInt(2, configurationId);
            updateStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Configuration> updateConfiguration(){
        List<Configuration> result = new ArrayList<>();
        try {

            // Ket noi voi database control
            Connection connection = connectDBConfiguration();
            if(connection == null) {
                // gui mail
            } else {
                // Lay tat cac dong co flags = true va status = PREPARED
                List<Configuration> configurations = performDatabaseOperations(connection, "PREPARED");
                // Duyet qua tung dong
                for (Configuration configuration : configurations) {
                    // Kiem tra status == error
                    if (configuration.getStatus().equals("ERROR")) {
                        // gui mail
                    } else {
                        // cap nhat status thanh CRAWLING
                        updateStatusInDatabase(configuration.getId(), "CRAWLING");
                        configuration.setStatus("CRAWLING");
                        result.add(configuration);

                    }
                }
                return result;
            }
        }
        catch (Exception e) {
            // gửi mail
            e.printStackTrace();
            return null;
        }

        return result;
    }

    public static void getData(Document doc, String path) {
        String title = doc.select(".title").text();

        String ngayThang = doc.select(".ngaykqxs .date .daymonth").text().replace("/","") + "" + doc.select(".ngaykqxs .date .year").text();
        Elements tinhElements = doc.select(".tblKQTinh");
        List<ProvinceResult> provinceResults = new ArrayList<>();
        for (Element tinhElement : tinhElements) {
            ProvinceResult provinceResult = new ProvinceResult();
            provinceResult.setTenTinh(tinhElement.select(".tentinh a .namelong").text());
            provinceResult.setLoaiVe(tinhElement.select(".loaive").text());
            List<Prize> prizes = new ArrayList<>();
            Elements giaiElements = tinhElement.select("td[class^='giai_']");
            for (Element giaiElement : giaiElements) {
                Prize prize = new Prize();
                String tenGiai = giaiElement.attr("class").replace("giai_", "");
                if (tenGiai.equals("6")) {
                    for (int i = 1; i <= 3; i++) {
                        Prize specialPrize = new Prize();
                        specialPrize.setTenGiai("6_" + i);
                        specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElement, i));
                        prizes.add(specialPrize);
                    }
                } else if (tenGiai.equals("4")) {
                    for (int i = 1; i <= 7; i++) {
                        Prize specialPrize = new Prize();
                        specialPrize.setTenGiai("4_" + i);
                        specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElement, i));
                        prizes.add(specialPrize);
                    }
                } else if (tenGiai.equals("3")) {
                    for (int i = 1; i <= 2; i++) {
                        Prize specialPrize = new Prize();
                        specialPrize.setTenGiai("3_" + i);
                        specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElement, i));
                        prizes.add(specialPrize);
                    }
                } else {
                    prize.setTenGiai(tenGiai);
                    prize.setSoTrungThuong(getSoTrungThuong(giaiElement, 0));
                    prizes.add(prize);
                }
            }
            provinceResult.setPrizes(prizes);
            provinceResults.add(provinceResult);
        }
        LotteryResult lotteryResult = new LotteryResult();
        lotteryResult.setTitle(title);
        lotteryResult.setNgayThang(ngayThang);
        lotteryResult.setProvinceResults(provinceResults);
        ExportToExcel.writeDataToExcelOneURL( title.substring(title.length()-2),path,provinceResults, ngayThang);

    }
    private static List<String> getSoTrungThuong(Element giaiElement, int index) {
        Elements soTrungThuongElements = giaiElement.select(".dayso");
        List<String> soTrungThuongList = new ArrayList<>();
        for (int i = 0; i < soTrungThuongElements.size(); i++) {
            if (index == 0 || i == index - 1) {
                Element soTrungThuongElement = soTrungThuongElements.get(i);
                soTrungThuongList.add(soTrungThuongElement.text());
            }
        }
        return soTrungThuongList;
    }


    public static void CrawlDataToFile() throws SQLException, ClassNotFoundException {


        for (Configuration configuration : updateConfiguration()) {
            try {
                Document doc = Jsoup.connect(configuration.getUrl()).get();
                getData(doc, configuration.getPath());
                updateStatusInDatabase(configuration.getId(), "EXTRACTING");
            } catch (Exception e) {
                updateStatusInDatabase(configuration.getId(), "ERROR");
            }
        }



    }
}


