package DAO;

import Bean.Configuration;
import Bean.Prize;
import Bean.ProvinceResult;
import com.opencsv.CSVWriter;
import org.jdbi.v3.core.Handle;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class ExportToExcel{

    public static void writeToFileCSV(Handle handle, String currentTime, Configuration config, List<ProvinceResult> provinceResults, String ngayThang) {
        String fileName = ngayThang + "_xoso.csv";
        String filePath = "D:/Data Warehouse/Data/" + fileName;
        String csvFilePath = filePath;
        try (CSVWriter writer = new CSVWriter(new FileWriter(csvFilePath))) {
            // Dữ liệu mẫu để viết vào CSV
            String[] header = {"prize", "province", "domain","number_winning","date"};
            writer.writeNext(header);
            for (int i =0 ; i< provinceResults.size(); i++) {
                ProvinceResult p = provinceResults.get(i);
                for(int j =0;j < p.getPrizes().size();j++) {
                    Prize pz = p.getPrizes().get(j);
                    for(int k =0; k< pz.getSoTrungThuong().size(); k++) {
                        String[] data = {pz.getTenGiai(), p.getTenTinh(), p.getDomain(), "\"" + pz.getSoTrungThuong().get(k) + "\"",ngayThang};
                        writer.writeNext(data);

                    }
                }

            }
            handle.createUpdate("UPDATE log SET file_name = :filename, description='Cập nhật status thành công' ,date_update = :currentTime WHERE configuration_id = :id")
                    .bind("filename", fileName)
                    .bind("currentTime", currentTime)
                    .bind("id",config.getId())
                    .execute();
            System.out.println("Dữ liệu đã được viết vào " + csvFilePath);
        } catch (IOException e) {
            handle.createUpdate("UPDATE log SET status = 'ERROR', description = 'Lỗi kết nối với dữ liệu', date_update = :currentTime WHERE configuration_id = :id")
                    .bind("currentTime", Crawling.getCurrentTime() )
                    .bind("id", config.getId())
                    .execute();
            SendEmail.sendMailError("Lỗi: "+e);
            e.printStackTrace();
        }
    }
}


