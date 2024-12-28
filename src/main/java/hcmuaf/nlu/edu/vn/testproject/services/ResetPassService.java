package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.daos.AccountDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class ResetPassService {
    public static String generateResetToken() {
        return UUID.randomUUID().toString();
    }

    public static void storeToken(int userId, String token) {
        String query = "INSERT INTO password_reset_tokens (userId, token, createdAt) VALUES (?, ?, NOW())";
        try (Connection conn = new DbContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setString(2, token);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void sendEmail(String recipient, String subject, String content) {
        final String senderEmail = "your-email@gmail.com";
        final String senderPassword = "your-email-password";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static int getUserIdByToken(String token) {
        return AccountDAO.getUserIdByToken(token);
    }
}
