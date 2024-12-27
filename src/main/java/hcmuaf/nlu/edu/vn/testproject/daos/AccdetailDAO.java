package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.libs.MD5;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.models.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccdetailDAO  {

    public Account getAccountById(int idAcc){
        String query = "SELECT userName, email FROM account WHERE idAcc = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Account account = null;
        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, idAcc);
            rs = ps.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setUserName(rs.getString("userName"));
                account.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    public AccDetail getAccDetailById(int idAcc){
        String query = "SELECT fullName, phoneNumber,address, birthDate, gender FROM accDetail WHERE idAcc = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        AccDetail accDetail = null;
        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, idAcc);
            rs = ps.executeQuery();
            if (rs.next()) {
                accDetail = new AccDetail();
                accDetail.setFullName(rs.getString("fullName"));
                accDetail.setPhoneNumber(rs.getString("phoneNumber"));
                accDetail.setAddress(rs.getString("address"));
                accDetail.setBirthDate(rs.getString("birthDate"));
                accDetail.setGender(rs.getInt("gender"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accDetail;
    }

    public void updateAccdetail(int idAcc, String fullName,String address, String phoneNumber, String birthDate, int gender){
        Connection con = null;
        PreparedStatement ps = null;
        String query = "UPDATE accDetail SET fullName = ?, phoneNumber = ?,address = ?, birthDate = ?, gender = ? WHERE idAcc = ?";
        try{
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, phoneNumber);
            ps.setString(3, address);
            ps.setString(4, birthDate);
            ps.setInt(5, gender);
            ps.setInt(6, idAcc);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        AccdetailDAO dao = new AccdetailDAO();
        System.out.println(dao.getAccountById(16));
        System.out.println(dao.getAccDetailById(16));
    }


}
