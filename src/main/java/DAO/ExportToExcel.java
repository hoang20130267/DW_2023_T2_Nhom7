package DAO;

import Bean.Prize;
import Bean.ProvinceResult;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ExportToExcel{
    public static void writeDataToExcel(List<ProvinceResult> provinceResultsMN, List<ProvinceResult> provinceResultsMT, String ngayThang) {
        Workbook workbook = new XSSFWorkbook();

        writeSheetData(workbook, "XosoMN", provinceResultsMN);
        writeSheetData(workbook, "XosoMT", provinceResultsMT);

        // Save workbook to file
        String fileName = ngayThang + "_xoso.xlsx";
        String filePath = "D:/test/" + fileName;
        Path fileFullPath = Paths.get(filePath);
        Path parentDir = fileFullPath.getParent();

        if (parentDir != null && !Files.exists(parentDir)) {
            try {
                Files.createDirectories(parentDir);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static void writeSheetData(Workbook workbook, String sheetName, List<ProvinceResult> provinceResults) {
        Sheet sheet = workbook.createSheet(sheetName);

        // Create header row
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("tenTinh");
        headerRow.createCell(1).setCellValue("loaiVe");

        Set<String> addedPrizes = new HashSet<>();

        // Dynamically create headers for prizes
        int columnIndex = 2;
        for (ProvinceResult provinceResult : provinceResults) {
            List<Prize> prizes = provinceResult.getPrizes();
            for (Prize prize : prizes) {
                String tenGiai = prize.getTenGiai();
                String giaiWithPrefix = "giai " + tenGiai;

                if (!addedPrizes.contains(giaiWithPrefix)) {
                    addedPrizes.add(giaiWithPrefix);
                    if (!tenGiai.equals("sau") && !tenGiai.equals("tu") && !tenGiai.equals("ba")) {
                        headerRow.createCell(columnIndex++).setCellValue(giaiWithPrefix);
                    } else {
                        for (int i = 1; i <= prize.getSoTrungThuong().size(); i++) {
                            headerRow.createCell(columnIndex++).setCellValue(giaiWithPrefix + "_" + i);
                        }
                    }
                }
            }
        }

        int rowIndex = 1;
        for (ProvinceResult provinceResult : provinceResults) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(provinceResult.getTenTinh());
            row.createCell(1).setCellValue(provinceResult.getLoaiVe());

            columnIndex = 2;
            List<Prize> prizes = provinceResult.getPrizes();
            for (Prize prize : prizes) {
                List<String> soTrungThuong = prize.getSoTrungThuong();
                for (String soTrung : soTrungThuong) {
                    row.createCell(columnIndex++).setCellValue(soTrung);
                }
            }
        }
    }
}

