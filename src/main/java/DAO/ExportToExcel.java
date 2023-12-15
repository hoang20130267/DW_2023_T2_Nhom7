package DAO;

import Bean.Configuration;
import Bean.Prize;
import Bean.ProvinceResult;
import com.opencsv.CSVWriter;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

public class ExportToExcel{

    public static void writeToFileCSV(Handle handle, String currentTime, Configuration config, List<ProvinceResult> provinceResults, String ngayThang) {

        //8. Tạo file excel tên <current_day>_xoso trong thư mục theo địa chỉ trong control.configurations
        String fileName = ngayThang + "_xoso.csv";
        String filePath = config.getPath()+"/" + fileName;
        String csvFilePath = filePath;

        //9. Lấy dữ liệu đã xử lý lưu vào file vừa tạo
        try (CSVWriter writer = new CSVWriter(new OutputStreamWriter(new FileOutputStream(csvFilePath), StandardCharsets.UTF_8),
                ',', CSVWriter.NO_QUOTE_CHARACTER, CSVWriter.NO_ESCAPE_CHARACTER, CSVWriter.DEFAULT_LINE_END)) {
            // Dữ liệu mẫu để viết vào CSV
            String[] header = {"prize", "province", "domain","number_winning","date"};
            writer.writeNext(header);
            for (int i =0 ; i< provinceResults.size(); i++) {
                ProvinceResult p = provinceResults.get(i);
                for(int j =0;j < p.getPrizes().size();j++) {
                    Prize pz = p.getPrizes().get(j);
                    for(int k =0; k< pz.getSoTrungThuong().size(); k++) {
                        String soTrungThuong = pz.getSoTrungThuong().get(k);
                        checkProvince(p.getTenTinh(), p.getDomain());
                        String[] data = {tenGiai(pz.getTenGiai()), p.getTenTinh(), p.getDomain(), soTrungThuong,
                               ngayThang};
                        writer.writeNext(data);
                    }
                }
            }

            handle.createUpdate("UPDATE logs SET file_name = :filename, description='Cập nhật status thành công' ," +
                            "date_update = :currentTime WHERE configuration_id = :id")
                    .bind("filename", fileName)
                    .bind("currentTime", currentTime)
                    .bind("id",config.getId())
                    .execute();

            System.out.println("Dữ liệu đã được viết vào " + csvFilePath);
        } catch (IOException e) {
            handle.createUpdate("UPDATE logs SET status = 'ERROR', description = 'Lỗi kết nối với dữ liệu', date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", Crawling.getCurrentTime() )
                    .bind("id", config.getId())
                    .execute();
            SendEmail.sendMailError("Lỗi: "+e);
            e.printStackTrace();
        }
    }
    private static String tenGiai(String giai) {
        String formartGiai = "";
        switch (giai) {
            case "tam":
                formartGiai = "Giải tám";
                break;
            case "bay":
                formartGiai = "Giải bảy";
                break;
            case "sau":
                formartGiai = "Giải sáu";
                break;
            case "nam":
                formartGiai = "Giải năm";
                break;
            case "tu":
                formartGiai = "Giải tư";
                break;
            case "ba":
                formartGiai = "Giải ba";
                break;
            case "nhi":
                formartGiai = "Giải nhì";
                break;
            case "nhat":
                formartGiai = "Giải nhất";
                break;
            case "dac_biet":
                formartGiai = "Giải đặc biệt";
                break;
            default:
                break;
        }
        return formartGiai;
    }
    private static String formatDate(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate dateBefore = LocalDate.parse(date, formatter);

        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        String formattedDate = dateBefore.format(outputFormatter);
        return formattedDate;
    }
    private static void checkProvince(String province, String domain) {
        boolean provinceExists = JDBIConnector.get("db3").withHandle(handle -> {
            return handle.createQuery("SELECT COUNT(*) FROM province_dim WHERE `name` = ?")
                    .bind(0, province)
                    .mapTo(Integer.class)
                    .findOnly() > 0;
        });
        if (!provinceExists) {
            Integer id = JDBIConnector.get("db3").withHandle(handle -> {
                return handle.createQuery("SELECT id FROM province_dim ORDER BY id DESC LIMIT 1").mapTo(Integer.class).one();
            });
            int newID = id + 1 ;
            JDBIConnector.get("db3").withHandle(handle -> {
                handle.createUpdate("INSERT INTO province_dim VALUES (?, ?, ?);")
                        .bind(0, newID)
                        .bind(1, idDomain(domain))
                        .bind(2, province)
                        .execute();
                return null;
            });
        }
    }
    private static int idDomain(String domain) {
        int idDomain = 0;
        switch (domain) {
            case "Nam":
                idDomain = 1;
                break;
            case "Trung":
                idDomain = 2;
                break;
            case "Bắc":
                idDomain = 3;
                break;
        }
        return idDomain;
    }
}


