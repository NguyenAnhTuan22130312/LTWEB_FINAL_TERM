package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO {
    public AccDetail getUserById(int id) {
        String query = "SELECT * FROM accdetail WHERE idAcc = ?";
        try (Connection conn = new DbContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new AccDetail(
                        rs.getInt("idAcc"),
                        rs.getString("fullName"),
                        rs.getString("phoneNumber"),
                        rs.getString("email"),
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

    public boolean updateUser(AccDetail user) {
        String query = "UPDATE accdetail SET fullName = ?, phoneNumber = ?, address = ?, gender = ?, birthDate = ? WHERE idAcc = ?";
        try (Connection conn = new DbContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getGender());
            ps.setString(5, user.getBirthDate());
            ps.setInt(6, user.getIdAcc());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
