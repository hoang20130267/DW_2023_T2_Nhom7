package db;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import static DAO.ReadConfigFile.getConfig;

public class DBProperties {
    private static Map<String, String> config = getConfig();
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }

    public static String getDbHost() {
        return config.get("url");
    }

    public static String getDbPort() {
        return config.get("port");
    }

    public static String getUsername() {
        return config.get("user_name");
    }

    public static String getPassword() {
        return config.get("password");
    }

    public static String getDbName(String dbName) {
        return prop.get(dbName + ".databaseName").toString();
    }
}
