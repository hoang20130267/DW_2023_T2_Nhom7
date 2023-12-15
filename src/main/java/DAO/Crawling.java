package DAO;

import Bean.Configuration;
import Bean.LotteryResult;
import Bean.Prize;
import Bean.ProvinceResult;
import db.ConnectToDB;
import org.jdbi.v3.core.Handle;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class Crawling {
    public static String getCurrentTime() {
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return currentTime.format(formatter);
    }
    public static String getCurrentTimeFileName() {
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
        return currentTime.format(formatter);
    }
    public static String getCurrentTimeDB(String input) throws ParseException {

        SimpleDateFormat inputFormat = new SimpleDateFormat("MM-dd-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date = inputFormat.parse(input);
        String outputDate = outputFormat.format(date);
        return outputDate;
    }
    public static List<String> getXoSo(Handle handle, Configuration config) {
        List<String> result = new ArrayList<>();
        try {

            // 6. Kết nối với website từ path trong controls configurations
            Document doc = Jsoup.connect(config.getUrl()).get();
            // 7 .Kết nối thành công

            Elements tabXstt = doc.getElementsByClass("title");
            if (tabXstt != null) {
                Elements links = tabXstt.select("a");

                for (int i = 3; i < 6; i++) {
                    String href = getHrefFromElement(links.get(i));
                    result.add(href);
                    System.out.println(href);
                }
            }
            return result;
        } catch (IOException e) {

            // 7.2 cập nhật status = error
            handle.createUpdate("UPDATE logs SET status = 'ERROR', description = 'Lỗi kết nối với địa chỉ của website', " +
                            "date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", getCurrentTime())
                    .bind("id", config.getId())
                    .execute();
            handle.close();
            // 8. gửi mail thông báo
            SendEmail.sendMailError("Lỗi kết nối với địa chỉ của website");
            // 30. Đóng kết nối database
            handle.close();

        }
        return null;
    }

    private static String getHrefFromElement(Element element) {
        return element.attr("href");
    }

    public static List<ProvinceResult>  lotteryMN(Configuration config,  Handle handle) {
        try {

            List<LotteryResult> result = new ArrayList<>();
            Document doc = Jsoup.connect(config.getUrl() + getXoSo(handle, config).get(0)).get();
            SimpleDateFormat inputFormat = new SimpleDateFormat("ddMMyyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("MM-dd-yyyy");
            // 7.1 Bắt đầu lấy dữ liệu
            String title = doc.select(".title").text();
            String ngayThang = doc.select(".ngaykqxs .date .daymonth").text().replace("/", "") + "" +
                    doc.select(".ngaykqxs .date .year").text();
            Date date = inputFormat.parse(ngayThang);
            String outputDate = outputFormat.format(date);
            Elements tinhElements = doc.select(".tblKQTinh");
            List<ProvinceResult> provinceResults = new ArrayList<>();
            for (Element tinhElement : tinhElements) {
                ProvinceResult provinceResult = new ProvinceResult();
                provinceResult.setTenTinh(tinhElement.select(".tentinh a .namelong").text());
                provinceResult.setDomain("Nam");
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
                provinceResult.setDate(outputDate);
                provinceResults.add(provinceResult);
            }

            return provinceResults;
        } catch (Exception e) {
            // 7.2 cập nhật status = error
            handle.createUpdate("UPDATE logs SET status = 'ERROR', description = 'Lỗi kết nối với địa chỉ của website', date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", getCurrentTime())
                            .bind("id", config.getId())
                    .execute();
            handle.close();
            // 8. gửi mail thông báo
            SendEmail.sendMailError("Lỗi kết nối với địa chỉ của website");
            // 30. Đóng kết nối database
            handle.close();
        }
        return null;
    }


    public static List<ProvinceResult> lotteryMT(Configuration config,  Handle handle) {
        try {
            Document docMT = Jsoup.connect(config.getUrl() + getXoSo(handle, config).get(1)).get();
            String titleMT = docMT.select(".title").text();
            SimpleDateFormat inputFormat = new SimpleDateFormat("ddMMyyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("MM-dd-yyyy");
            // 7.1 Bắt đầu lấy dữ liệu
            String ngayThang = docMT.select(".ngaykqxs .date .daymonth").text().replace("/", "") + "" +
                    docMT.select(".ngaykqxs .date .year").text();
            Date date = inputFormat.parse(ngayThang);
            String outputDate = outputFormat.format(date);
            Elements tinhElementsMT = docMT.select(".tblKQTinh");
            List<ProvinceResult> provinceResultsMT = new ArrayList<>();
            for (Element tinhElementMT : tinhElementsMT) {
                ProvinceResult provinceResultMT = new ProvinceResult();
                provinceResultMT.setTenTinh(tinhElementMT.select(".tentinh a .namelong").text());
                provinceResultMT.setDomain("Trung");
                List<Prize> prizesMT = new ArrayList<>();
                Elements giaiElementsMT = tinhElementMT.select("td[class^='giai_']");
                for (Element giaiElementMT : giaiElementsMT) {
                    Prize prizeMT = new Prize();
                    String tenGiaiMT = giaiElementMT.attr("class").replace("giai_", "");
                    if (tenGiaiMT.equals("6")) {
                        for (int i = 1; i <= 3; i++) {
                            Prize specialPrize = new Prize();
                            specialPrize.setTenGiai("6_" + i);
                            specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElementMT, i));
                            prizesMT.add(specialPrize);
                        }
                    } else if (tenGiaiMT.equals("4")) {
                        for (int i = 1; i <= 7; i++) {
                            Prize specialPrize = new Prize();
                            specialPrize.setTenGiai("4_" + i);
                            specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElementMT, i));
                            prizesMT.add(specialPrize);
                        }
                    } else if (tenGiaiMT.equals("3")) {
                        for (int i = 1; i <= 2; i++) {
                            Prize specialPrize = new Prize();
                            specialPrize.setTenGiai("3_" + i);
                            specialPrize.setSoTrungThuong(getSoTrungThuong(giaiElementMT, i));
                            prizesMT.add(specialPrize);
                        }
                    } else {
                        prizeMT.setTenGiai(tenGiaiMT);
                        prizeMT.setSoTrungThuong(getSoTrungThuong(giaiElementMT, 0));
                        prizesMT.add(prizeMT);
                    }
                }
                provinceResultMT.setPrizes(prizesMT);
                provinceResultMT.setDate(outputDate);
                provinceResultsMT.add(provinceResultMT);

            }
            // Tạo đối tượng LotteryResult và gán thông tin

            return provinceResultsMT;
        } catch (Exception e) {
            handle.createUpdate("UPDATE logs SET status = 'ERROR', description = 'Lỗi kết nối với dữ liệu', date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", getCurrentTime() )
                    .bind("id", config.getId())
                    .execute();
            handle.close();
        }
        return null;
    }
    public static List<ProvinceResult> lotteryMB(Configuration config,  Handle handle) {
        try {
            Document docMB = Jsoup.connect(config.getUrl() + getXoSo(handle, config).get(2)).get();
            String titleMB = docMB.select("div.title").text();

            String dateMB = docMB.select("div.ngaykqxs span.daymonth").text() + "/"
                    + docMB.select("div.ngaykqxs span.year").text();
            System.out.println(dateMB);
            String provinceMB = docMB.select("td.tentinh span.phathanh a").text();
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date date = inputFormat.parse(dateMB);
            String outputDate = outputFormat.format(date);
            List<ProvinceResult> provinceResultsMB = new ArrayList<>();
            ProvinceResult provinceResultMB = new ProvinceResult();
            provinceResultMB.setTenTinh(provinceMB);
            provinceResultMB.setDomain("Bắc");
            List<Prize> prizesMB = new ArrayList<>();

            // Lấy các phần tử chứa thông tin giải
            Elements content = docMB.select(".kqxs_content");
            Elements giaiElementsMB = content.select("td[class^='giai_']");

            // Duyệt qua các phần tử giải
            for (Element giaiElementMB : giaiElementsMB) {

                // Lấy tên giải để lưu
                Prize prizeMB = new Prize();
                String tenGiaiMB = giaiElementMB.attr("class").replace("giai_", "");

                // Xử lý tên giải đặc biệt
                if (tenGiaiMB.equals("dac_biet")) {
                    Prize specialPrize = new Prize();
                    specialPrize.setTenGiai(tenGiaiMB);
                    String kyHieuDB = docMB.select("div.giaiDbmoi span.kyhieuDB1ve span").text();
                    String soTrungThuong = getSoTrungThuong(giaiElementMB, 0) + " " +kyHieuDB;
                    specialPrize.setSoTrungThuong(Collections.singletonList(soTrungThuong.replace("[", "").replace("]", "")));
                    prizesMB.add(specialPrize);
                } else {
                    prizeMB.setTenGiai(tenGiaiMB);
                    prizeMB.setSoTrungThuong(getSoTrungThuong(giaiElementMB, 0));
                    prizesMB.add(prizeMB);
                }
            }
            provinceResultMB.setPrizes(prizesMB);
            provinceResultMB.setDate(outputDate);
            provinceResultsMB.add(provinceResultMB);
            LotteryResult lotteryResultMB = new LotteryResult();
            lotteryResultMB.setTitle(titleMB);
            lotteryResultMB.setNgayThang(outputDate);
            lotteryResultMB.setProvinceResults(provinceResultsMB);
            return provinceResultsMB;
        } catch (Exception e) {
            handle.createUpdate("UPDATE logs SET status = 'ERROR', description = 'Lỗi kết nối với dữ liệu', date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", getCurrentTime() )
                    .bind("id", config.getId())
                    .execute();
            handle.close();
        }
        return null;
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
}
