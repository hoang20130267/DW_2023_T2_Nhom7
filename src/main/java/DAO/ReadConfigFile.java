package DAO;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ReadConfigFile {
    public static Map<String, String> getConfig() {
        String fileName = "A:/F/2023-HK1/DataWarehouse/FileConfig/config.txt";
        Map<String, String> result = new HashMap<>();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.contains("=")) {
                    String[] parts = line.split("=");
                    String key = parts[0].trim();
                    String value = parts[1].trim();
                    if (key.equalsIgnoreCase("password") && value.isEmpty()) {
                        value = "";
                    }
                    result.put(key, value);
                }
            }
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) {
        Map<String, String> config = getConfig();

        String url = config.get("url");
        String databaseName = config.get("user_name");
        String password = config.get("password");
        String port = config.get("port");

        System.out.println(url);
        System.out.println(databaseName);
        System.out.println(password);
        System.out.println(port);
    }
}