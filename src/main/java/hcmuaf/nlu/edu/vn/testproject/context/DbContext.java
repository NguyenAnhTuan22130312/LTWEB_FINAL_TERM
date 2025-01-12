package hcmuaf.nlu.edu.vn.testproject.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbContext {
    // Thông tin cấu hình database
    private final String URL = "jdbc:mysql://localhost:3306/foodt3";
    private final String USER = "root"; // Tên user, mặc định là 'root'
    private final String PASSWORD = ""; // Mật khẩu, thường mặc định trống trên phpMyAdmin

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        // Đăng ký MySQL Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Kết nối tới database
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try {
            DbContext db = new DbContext();
            Connection conn = db.getConnection();
            System.out.println("Kết nối thành công!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
