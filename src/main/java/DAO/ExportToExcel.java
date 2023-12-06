package DAO;

import Bean.Configuration;
import Bean.LotteryResult;
import Bean.Prize;
import Bean.ProvinceResult;
import com.opencsv.CSVWriter;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jdbi.v3.core.Handle;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ExportToExcel{

    public static void test(Handle handle, String currentTime, Configuration config,List<ProvinceResult> provinceResults,String ngayThang) {
        String fileName = ngayThang + "_xoso.csv";
        String filePath = "A:/F/2023-HK1/DataWarehouse/data/" + fileName;
        String csvFilePath = filePath;
        try (CSVWriter writer = new CSVWriter(new FileWriter(csvFilePath))) {
            // Dữ liệu mẫu để viết vào CSV
            String[] header = {"prize", "province", "domain","number_winning"};
            writer.writeNext(header);
            for (int i =0 ; i< provinceResults.size(); i++) {
                ProvinceResult p = provinceResults.get(i);
                for(int j =0;j < p.getPrizes().size();j++) {
                    Prize pz = p.getPrizes().get(j);
                    for(int k =0; k< pz.getSoTrungThuong().size(); k++) {
                        String[] data = {pz.getTenGiai(),p.getTenTinh(),p.getDomain(),String.valueOf(pz.getSoTrungThuong().get(k))};
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
            e.printStackTrace();
        }
    }
}


