package ETL;

import Bean.Configuration;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import java.util.Properties;

public class Transform {

    public static Connection connectDBStagging() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/stagging";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối Database thành công");
            return  connection;
        } catch (SQLException e) {
            sendMailError();
            throw new SQLException("Kết nối Database không thành công");
        }
    }

    public static Connection connectDBControls() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/controls";
        String username = "root";
        String password = "nguyenhuudat";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối Database thành công");
            return  connection;
        } catch (SQLException e) {
            throw new SQLException("Kết nối Database không thành công");
        }
    }

    public static void sendMailError(){
        String fromEmail = "20130224@st.hcmuaf.edu.vn";
        String password = "";
        String toEmail = "nguyenhwdat1912@gmail.com";


        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        properties.put("mail.smtp.port", "587"); //TLS Port
        properties.put("mail.smtp.auth", "true"); //enable authentication
        properties.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject("Thông báo lỗi");
            message.setContent("Kết nối Database Stagging không thành công. Vui lòng kiểm tra lại!", "text/plain");
            System.out.println("Gửi mail thành công");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateStatusInDB(int configurationID, String newStatus) throws SQLException, ClassNotFoundException {
        String querry = "UPDATE configurations SET status = ? WHERE id = ?";
        Connection connection = connectDBControls();
        PreparedStatement preparedStatement = connection.prepareStatement(querry);
        preparedStatement.setString(1, newStatus);
        preparedStatement.setInt(2, configurationID);
        preparedStatement.executeUpdate();
    }

    public static Configuration getConfiguration(String status) throws SQLException, ClassNotFoundException {
        String querry = "SELECT * FROM configurations WHERE status = ?";
        Connection connection = connectDBControls();
        PreparedStatement preparedStatement = connection.prepareStatement(querry);
        preparedStatement.setString(1, status);
        ResultSet resultSet = preparedStatement.executeQuery();

        if(resultSet.next()){
            Configuration configuration = new Configuration();
            configuration.setId(resultSet.getInt(1));
            return  configuration;
        } else {
            return null;
        }
    }

    public static void updateConfiguration() throws SQLException, ClassNotFoundException {
        Connection controls = connectDBControls();
        Connection stagging = connectDBStagging();
        try {
            if (stagging == null){
                updateStatusInDB(getConfiguration("EXTRACTING").getId(), "ERROR");
                controls.close();
            } else{

            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
