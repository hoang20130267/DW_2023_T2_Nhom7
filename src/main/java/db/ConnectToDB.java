package db;

import DAO.ReadConfigFile;
import org.jdbi.v3.core.Jdbi;

import java.util.Map;

public class ConnectToDB {
    public static Jdbi connectionToDB(String nameDB) {
        Map<String, String> configFile = ReadConfigFile.getConfig();
        String ip = configFile.get("url");
        String root =configFile.get("user_name");
        String password = configFile.get("password");
        String url = "jdbc:mysql://"+ip+":3306/"+nameDB;
        Jdbi jdbi = Jdbi.create(url, root, password);
        return jdbi;
    }
}
