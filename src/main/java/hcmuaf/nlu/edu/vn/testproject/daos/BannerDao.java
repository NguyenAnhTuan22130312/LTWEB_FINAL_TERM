package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Banner;
import hcmuaf.nlu.edu.vn.testproject.models.ReviewFood;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BannerDao {
    static List<Banner> banners;
    static {
        BannerDao bannerDao = new BannerDao();
        bannerDao.getAllBanner();
    }

    public static List<Banner> getBanners() {
        return banners;
    }

    // Hàm lấy tất cả các món ăn từ cơ sở dữ liệu
    public void getAllBanner() {

//        String query = "WITH RankedReviews AS (" +
//                "  SELECT ac.userName,rv.idAcc,rv.idReview,rv.idFood,rv.rating,rv.commentu,rv.createdAt,ROW_NUMBER() OVER (PARTITION BY rv.idFood ORDER BY rv.createdAt DESC) AS rnk " +
//                "FROM review rv JOIN account ac ON rv.idAcc = ac.idAcc )" +
//                "SELECT userName, idAcc, idReview, idFood, rating,commentu,createdAt FROM RankedReviews WHERE rnk <= 10;";
        String query="select * from banner";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Tạo kết nối cơ sở dữ liệu
            con = new DbContext().getConnection();
            // Kiểm tra kết nối
            if (con != null) {
                System.out.println("Kết nối cơ sở dữ liệu thành công!");
            } else {
                System.out.println("Kết nối cơ sở dữ liệu thất bại!");
                // Trả về danh sách rỗng nếu không kết nối được
            }

            // Chuẩn bị câu lệnh SQL
            ps = con.prepareStatement(query);
            // Thực thi câu lệnh
            rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và tạo danh sách món ăn
            while (rs.next()) {
                new Banner(rs.getInt("idBanner"),
                        rs.getString("url"),
                        rs.getDate("createdAt")
                );
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Đảm bảo rằng kết nối, câu lệnh và result set được đóng đúng cách
            closeResources(rs, ps, con);
        }
    }

    // Phương thức đóng các tài nguyên
    private void closeResources(ResultSet rs, PreparedStatement ps, Connection con) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
        }
    }
}
