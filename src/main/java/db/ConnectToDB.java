package db;

import org.jdbi.v3.core.Jdbi;

public class ConnectToDB {
    public static Jdbi connectionToDB(String nameDB,String user, String pass) {
        String url = "jdbc:mysql://localhost:3306/"+nameDB;
        Jdbi jdbi = Jdbi.create(url, user, pass);
        return jdbi;
    }
}
