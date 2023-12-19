package db;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }
    static ReadConfig config = new ReadConfig();
    public static String getDbHost() {
        return config.getConfig("host");
    }

    public static String getDbPort() {
        return config.getConfig("port");
    }

    public static String getUsername() {
        return config.getConfig("username");
    }

    public static String getPassword() {
        return config.getConfig("password");
    }

    public static String getDbName(String dbName) {
        return prop.get(dbName + ".databaseName").toString();
    }
}
