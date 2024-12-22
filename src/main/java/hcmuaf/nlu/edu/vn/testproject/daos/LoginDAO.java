package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
    public Account login(String username, String password) {
        String query = "SELECT * FROM Account WHERE userName = ? AND pass = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
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

    //Mã hóa MD5
    //Chưa làm
    public void signUp(String userName, String password) {
        String query = "INSERT INTO Account (userName, pass, idRole) VALUES (?, ?, 2)";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.executeUpdate();
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



    public Account checkUserExist(String username) {
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
        LoginDAO loginDAO = new LoginDAO();
        try{
           loginDAO.login("atuan1", "123");
            System.out.println("dang nhap thành công");

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }



}
