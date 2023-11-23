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

    public static String getDbHost(String dbName) {
        return prop.get(dbName + ".host").toString();
    }

    public static String getDbPort(String dbName) {
        return prop.get(dbName + ".port").toString();
    }

    public static String getUsername(String dbName) {
        return prop.get(dbName + ".username").toString();
    }

    public static String getPassword(String dbName) {
        return prop.get(dbName + ".password").toString();
    }

    public static String getDbName(String dbName) {
        return prop.get(dbName + ".databaseName").toString();
    }
}
