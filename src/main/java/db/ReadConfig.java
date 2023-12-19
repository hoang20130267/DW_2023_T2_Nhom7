package db;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class ReadConfig {
    public static String getConfig(String name) {
        String config = "";
        // Đường dẫn đến file txt
        File configFile = new File("src/main/resources/config.txt");
        String filePath = configFile.getAbsolutePath();

        // Tạo đối tượng File với đường dẫn
        File file = new File(filePath);

        // Kiểm tra xem file có tồn tại không
        if (!file.exists()) {
            System.out.println("File không tồn tại.");
            return null;
        }

        // Sử dụng BufferedReader để đọc file
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            // Đọc từng dòng trong file
            while ((line = reader.readLine()) != null) {
                // Phân tách dòng thành cặp key-value
                String[] parts = line.split("=");
                if (parts.length == 2) {
                    String key = parts[0].trim();
                    String value = parts[1].trim();

                    // Kiểm tra key và gán giá trị tương ứng
                    if (key.equals(name)) {
                        config = value;
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Đã xảy ra lỗi khi đọc file: " + e.getMessage());
        }
        return config;
    }

    public static void main(String[] args) {
        System.out.println(getConfig("url"));
    }
}
