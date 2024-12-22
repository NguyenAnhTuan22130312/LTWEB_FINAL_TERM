package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;

import java.sql.*;
import java.util.*;

public class FoodDAO {

    static Map<Integer, Food> data = new HashMap<>();

    static {
        FoodDAO pdd = new FoodDAO();
        pdd.getAllFood();
    }

    public List<Food> getAll() {
        return new ArrayList<>(data.values());
    }


    // Hàm lấy tất cả các món ăn từ cơ sở dữ liệu
    public void getAllFood() {

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
                // Trả về danh sách rỗng nếu không kết nối được
            }

            // Chuẩn bị câu lệnh SQL
            ps = con.prepareStatement(query);
            // Thực thi câu lệnh
            rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và tạo danh sách món ăn
            while (rs.next()) {
                data.put(rs.getInt("idFood"),
                        new Food(
                                rs.getInt("idFood"),
                                rs.getString("foodName"),
                                rs.getInt("price"),
                                rs.getInt("discountPrice"),
                                rs.getInt("quantity"),
                                rs.getString("img"),
                                rs.getString("description"),
                                rs.getInt("idCategory"),
                                rs.getInt("isDeleted"),
                                rs.getInt("sold"),
                                rs.getInt("views"),
                                rs.getTimestamp("createdAt"),
                                rs.getTimestamp("updatedAt")
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
    }

    public List<Food> getFoodsByCategory(int idCategory) {

        String query = "SELECT * FROM food WHERE idCategory = ?";
        List<Food> foodList = new ArrayList<>();

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
            ps.setInt(1, idCategory);
            // Thực thi câu lệnh
            rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và tạo danh sách món ăn
            while (rs.next()) {
                foodList.add(
                        new Food(
                                rs.getInt("idFood"),
                                rs.getString("foodName"),
                                rs.getInt("price"),
                                rs.getInt("discountPrice"),
                                rs.getInt("quantity"),
                                rs.getString("img"),
                                rs.getString("description"),
                                rs.getInt("idCategory"),
                                rs.getInt("isDeleted"),
                                rs.getInt("sold"),
                                rs.getInt("views"),
                                rs.getTimestamp("createdAt"),
                                rs.getTimestamp("updatedAt")
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

    public List<Food> searchByName(String textSearch) {
        List<Food> foodList = new ArrayList<>();
        for (Food food : data.values()) {
            if (food.getFoodName().toLowerCase().contains(textSearch.toLowerCase())) {
                foodList.add(food);
            }
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

    public List<Food> getPaginatedFoods(int offset, int pageSize) {
        List<Food> foodList = new ArrayList<>();
        int start = offset;
        int end = Math.min(offset + pageSize, data.size());

        List<Integer> keys = new ArrayList<>(data.keySet());
        keys.sort(Integer::compareTo); // Đảm bảo các khóa được sắp xếp tăng dần

        for (int i = start; i < end; i++) {
            foodList.add(data.get(keys.get(i)));
        }
        return foodList;
    }

    public int getTotalFoods() {
        return data.size();
    }

    public List<Food> getTop4Sold() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> Integer.compare(f2.getSold(), f1.getSold()));
        List<Food> top4Sold = foodList.subList(0, 4);
        return top4Sold;
    }

    public List<Food> getTop4View() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> Integer.compare(f2.getViews(), f1.getViews()));
        List<Food> top4View = foodList.subList(0, 4);
        return top4View;
    }

    public List<Food> getTop4Propose() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> f2.getCreatedAt().compareTo(f1.getCreatedAt()));
        List<Food> top4Propose = foodList.subList(0, 4);
        return top4Propose;
    }

}
