package DAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    public static void sendMailError(String content) {
        String fromEmail = "20130224@st.hcmuaf.edu.vn";
        String password = "HuuBi19/12";
        String toEmail = "nguyenhwdat1912@gmail.com";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        properties.put("mail.smtp.port", "587"); // TLS Port
        properties.put("mail.smtp.auth", "true"); // enable authentication
        properties.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Thông báo lỗi");
            message.setText(content);

            // Send the message
            Transport.send(message);

            System.out.println("Gửi mail thành công");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        sendMailError("Kết nối thành công");
    }
}
