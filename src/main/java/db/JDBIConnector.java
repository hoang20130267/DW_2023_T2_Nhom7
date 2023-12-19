package db;

import org.jdbi.v3.core.Jdbi;
import com.mysql.cj.jdbc.MysqlDataSource;
import javax.sql.DataSource;
import java.sql.SQLException;

public class JDBIConnector {
    private static Jdbi jdbi;

    private JDBIConnector() {
    }

    public static Jdbi get(String dbName) {
        if (jdbi == null) makeConnect(dbName);
        return jdbi;
    }

    private static void makeConnect(String dbName) {
        try {
            DataSource dataSource = createDataSource(dbName);
            jdbi = Jdbi.create(dataSource);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
    }

    private static DataSource createDataSource(String dbName) throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.getDbHost() + ":" + DBProperties.getDbPort() + "/" + DBProperties.getDbName(dbName));
        dataSource.setUser(DBProperties.getUsername());
        dataSource.setPassword(DBProperties.getPassword());
        dataSource.setUseSSL(false);
        dataSource.setAutoReconnect(true);
        return dataSource;
    }
}