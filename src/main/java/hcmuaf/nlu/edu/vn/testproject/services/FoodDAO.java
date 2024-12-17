package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {

    // Hàm lấy tất cả các món ăn từ cơ sở dữ liệu
    public List<Food> getAllFood() {
        List<Food> foodList = new ArrayList<>();
        String query = "SELECT * FROM Food";
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
                return foodList; // Trả về danh sách rỗng nếu không kết nối được
            }

            // Chuẩn bị câu lệnh SQL
            ps = con.prepareStatement(query);
            // Thực thi câu lệnh
            rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và tạo danh sách món ăn
            while (rs.next()) {
                foodList.add(new Food(
                        rs.getInt("idFood"),
                        rs.getString("foodName"),
                        rs.getInt("price"),
                        rs.getString("img"),
                        rs.getString("description")
                ));
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Đảm bảo rằng kết nối, câu lệnh và result set được đóng đúng cách
            closeResources(rs, ps, con);
        }

        return foodList;
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

    // Phương thức main để kiểm tra
    public static void main(String[] args) {
        FoodDAO foodDao = new FoodDAO();
        List<Food> foodList = foodDao.getAllFood();

        if (foodList.isEmpty()) {
            System.out.println("Không có món ăn nào!");
        } else {
            for (Food food : foodList) {
                System.out.println(food);
            }
        }
    }
}
