package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.libs.MD5;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.services.AccDetailService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccdetailDAO implements AccDetailService {

    @Override
    public void save(AccDetail accDetail) {
        String query = "INSERT INTO accDetail (idAcc, fullName, phoneNumber, address, gender, birthDate) " +
                "VALUES (?, ?, ?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE fullName = ?, phoneNumber = ?, address = ?, gender = ?, birthDate = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accDetail.getIdAcc());
            ps.setString(2, accDetail.getFullName());
            ps.setString(3, accDetail.getPhoneNumber());
            ps.setString(4, accDetail.getAddress());
            ps.setInt(5, accDetail.getGender());
            ps.setString(6, accDetail.getBirthDate());
            rs = ps.executeQuery();

            // Update fields
            ps.setString(7, accDetail.getFullName());
            ps.setString(8, accDetail.getPhoneNumber());
            ps.setString(9, accDetail.getAddress());
            ps.setInt(10, accDetail.getGender());
            ps.setString(11, accDetail.getBirthDate());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public AccDetail getAccountById(int idAcc) {
        String query = "SELECT * FROM accDetail WHERE idAcc = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, idAcc);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new AccDetail(
                        rs.getInt("idAcc"),
                        rs.getString("fullName"),
                        rs.getString("phoneNumber"),
                        rs.getString("address"),
                        rs.getInt("gender"),
                        rs.getString("birthDate")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
