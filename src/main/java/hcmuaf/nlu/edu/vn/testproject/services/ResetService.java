package hcmuaf.nlu.edu.vn.testproject.services;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;

public class ResetService {
    private final int LIMIT_MINUS = 10;
    private final String from = "anhtuanwork0925@gmail.com";
    private final String password = "rmvm vpro bbxb xixd";

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(10); // Token tồn tại được 10p kể từ khi đc tạo
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }

    public boolean sendEmail(String to, String link, String name) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // địa chỉ máy chủ của gmail
        props.put("mail.smtp.port", "587"); // địa chỉ cổng
        props.put("mail.smtp.auth", "true"); //Yêu cầu xác thực user
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("content-type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Reset Password", "UTF-8");
            String content = "<h1>Xin chào " + name + "</h1>" + "<p>Click the link to reset your password " + "<a href= " + link + ">Click here</a></p>";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg); // Thực hiện gửi đi
            System.out.println("Send successfully");
            return true;
        } catch (Exception e) {
            System.out.println("Send errror");
            System.out.println(e);
            return false;
        }
    }
}
