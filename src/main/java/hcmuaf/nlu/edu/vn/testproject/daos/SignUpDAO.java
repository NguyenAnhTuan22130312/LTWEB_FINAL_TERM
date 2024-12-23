package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.libs.MD5;
import hcmuaf.nlu.edu.vn.testproject.models.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignUpDAO {


    public static void signUp(String userName, String password, String email) {
        String query = "INSERT INTO account (userName, pass, idRole,email) VALUES (?, ?, 2,?)";
        String queryAccDetail = "INSERT INTO accdetail (idAcc, fullName, phoneNumber, email, address, gender, birthDate, createdAt, UpdatedAt) VALUES (LAST_INSERT_ID(),NULL,NULL,?,NULL,NULL,NULL,NOW(), NOW() )";
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement psCtAcc = null;
        ResultSet rs = null;
        String hashedPassword = MD5.getMD5(password);

        try {
            con = new DbContext().getConnection();

            ps = con.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, userName);
            ps.setString(2, hashedPassword);
            ps.setString(3, email);
            ps.executeUpdate();

            // Chèn email vào bảng ct_acc
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                psCtAcc = con.prepareStatement(queryAccDetail);
                psCtAcc.setString(1, email);  // Đưa email vào bảng accDetail
                psCtAcc.executeUpdate();
            }




        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }



    public static Account checkUserExist(String username) {
        String query = "SELECT * FROM Account WHERE userName = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            while(rs.next()) {
                return new Account(
                        rs.getInt("idAcc"),
                        rs.getInt("idRole"),
                        rs.getString("pass"),
                        rs.getString("userName")
                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }


        return null;
    }

    public static void main(String[] args) {
        String userName = "anhtuan";
        String password = "123456789";
        String email = "anhtuan@123.com";
        SignUpDAO.signUp(userName, password, email);
        System.out.println("Đăng ký thành công!");
    }
}
