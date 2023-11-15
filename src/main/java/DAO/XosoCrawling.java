package DAO;

import Bean.LotteryResult;
import Bean.Prize;
import Bean.ProvinceResult;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class XosoCrawling {
    public static void main(String[] args) {
        try {
            // Kết nối đến URL chứa dữ liệu xổ số
            Document doc = Jsoup.connect("https://xosohomnay.com.vn/truc-tiep-xo-so-mien-nam-xstt-mn-xsmn").get();

            // Lấy thông tin chung
            String title = doc.select(".title").text();
            String ngayThang = doc.select(".ngaykqxs .date .daymonth").text().replace("/","") + "" + doc.select(".ngaykqxs .date .year").text();

//            System.out.println("Title: " + title);
//            System.out.println("Ngày tháng: " + ngayThang);

            // Lấy thông tin từng tỉnh
            Elements tinhElements = doc.select(".tblKQTinh");
            List<ProvinceResult> provinceResults = new ArrayList<>();
            for (Element tinhElement : tinhElements) {
                // Lấy tên tỉnh và loại vé để in
//                String tenTinh = tinhElement.select(".tentinh a .namelong").text();
//                String loaiVe = tinhElement.select(".loaive").text();
//
//                System.out.println("\nTỉnh: " + tenTinh);
//                System.out.println("Loại vé: " + loaiVe);

                // Lấy tên tỉnh và loại vé để lưu
                ProvinceResult provinceResult = new ProvinceResult();
                provinceResult.setTenTinh(tinhElement.select(".tentinh a .namelong").text());
                provinceResult.setLoaiVe(tinhElement.select(".loaive").text());

                List<Prize> prizes = new ArrayList<>();

                // Lấy các phần tử chứa thông tin giải
                Elements giaiElements = tinhElement.select("td[class^='giai_']");

                // Duyệt qua các phần tử giải
                for (Element giaiElement : giaiElements) {

                    // Lấy tên giải để lưu
                    Prize prize = new Prize();
                    String tenGiai = giaiElement.attr("class").replace("giai_", "");

                    // Xử lý tên giải đặc biệt
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

//                    Elements soTrungThuongElements = giaiElement.select(".dayso");
//                    for (int i = 0; i < soTrungThuongElements.size(); i++) {
//                        Element soTrungThuongElement = soTrungThuongElements.get(i);
//                        String soTrungThuong = soTrungThuongElement.text();
//                        if (tenGiai.equals("tam") || tenGiai.equals("bay") || tenGiai.equals("nam")
//                                || tenGiai.equals("nhi") || tenGiai.equals("nhat") || tenGiai.equals("dac_biet")) {
//                            System.out.println("Giai " + tenGiai + ": " + soTrungThuong);
//                        } else {
//                            System.out.println("Giai " + tenGiai + "_" + (i + 1) + ": " + soTrungThuong);
//                        }
//                    }
//                    System.out.println(prize);
                }
                provinceResult.setPrizes(prizes);
                provinceResults.add(provinceResult);
            }
            // Tạo đối tượng LotteryResult và gán thông tin
            LotteryResult lotteryResult = new LotteryResult();
            lotteryResult.setTitle(title);
            lotteryResult.setNgayThang(ngayThang);
            lotteryResult.setProvinceResults(provinceResults);

            // Kết nối đến URL chứa dữ liệu xổ số
            Document docMT = Jsoup.connect("https://xosohomnay.com.vn/truc-tiep-xo-so-mien-trung-xstt-mt-xsmt").get();
            // Lấy thông tin chung
            String titleMT = docMT.select(".title").text();
            // Lấy thông tin từng tỉnh
            Elements tinhElementsMT = docMT.select(".tblKQTinh");
            List<ProvinceResult> provinceResultsMT = new ArrayList<>();
            for (Element tinhElementMT : tinhElementsMT) {

                // Lấy tên tỉnh và loại vé để lưu
                ProvinceResult provinceResultMT = new ProvinceResult();
                provinceResultMT.setTenTinh(tinhElementMT.select(".tentinh a .namelong").text());
                provinceResultMT.setLoaiVe(tinhElementMT.select(".loaive").text());

                List<Prize> prizesMT = new ArrayList<>();

                // Lấy các phần tử chứa thông tin giải
                Elements giaiElementsMT = tinhElementMT.select("td[class^='giai_']");

                // Duyệt qua các phần tử giải
                for (Element giaiElementMT : giaiElementsMT) {

                    // Lấy tên giải để lưu
                    Prize prizeMT = new Prize();
                    String tenGiaiMT = giaiElementMT.attr("class").replace("giai_", "");

                    // Xử lý tên giải đặc biệt
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
                provinceResultsMT.add(provinceResultMT);
            }
            // Tạo đối tượng LotteryResult và gán thông tin
            LotteryResult lotteryResultMT = new LotteryResult();
            lotteryResultMT.setTitle(titleMT);
            lotteryResultMT.setNgayThang(ngayThang);
            lotteryResultMT.setProvinceResults(provinceResultsMT);

            ExportToExcel.writeDataToExcel(provinceResults, provinceResultsMT, ngayThang);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
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