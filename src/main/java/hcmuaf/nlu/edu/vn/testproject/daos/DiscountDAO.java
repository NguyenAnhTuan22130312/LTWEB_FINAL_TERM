package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Discount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO {
    private List<Discount> discounts;

    public DiscountDAO() {
        discounts = new ArrayList<Discount>();
    }

    public List<Discount> getAllDiscounts() {
        String query = "SELECT * FROM discountcode";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Tạo kết nối cơ sở dữ liệu
            conn = new DbContext().getConnection();
            // Kiểm tra kết nối
            if (conn != null) {
                System.out.println("Kết nối cơ sở dữ liệu thành công!");
            } else {
                System.out.println("Kết nối cơ sở dữ liệu thất bại!");
                // Trả về danh sách rỗng nếu không kết nối được
            }

            // Chuẩn bị câu lệnh SQL
            ps = conn.prepareStatement(query);
            // Thực thi câu lệnh
            rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và tạo danh sách món ăn
            while (rs.next()) {
                discounts.add(new Discount(
                        rs.getInt("idCode"),
                        rs.getString("codeName"),
                        rs.getDouble("discountRate"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Đảm bảo rằng kết nối, câu lệnh và result set được đóng đúng cách
            closeResources(rs, ps, conn);
        }
        return discounts;
    }

    // Phương thức đóng các tài nguyên
    private void closeResources(ResultSet rs, PreparedStatement ps, Connection con) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        }
    }

}
