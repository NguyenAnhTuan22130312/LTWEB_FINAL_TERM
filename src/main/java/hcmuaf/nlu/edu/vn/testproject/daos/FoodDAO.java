package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;

import java.sql.*;
import java.util.*;

public class FoodDAO {

    private Map<Integer, Food> data;

    public FoodDAO() {
        this.data = new HashMap<>();
        getAllFood();
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

    public Food getById(int id) {
        if (!data.containsKey(id)) return null;
        return data.get(id);
    }


    public List<Food> getAll() {
        return new ArrayList<>(data.values());
    }

    public List<Food> getTopSold() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> Integer.compare(f2.getSold(), f1.getSold()));
        return foodList;
    }

    public List<Food> getTopView() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> Integer.compare(f2.getViews(), f1.getViews()));
        return foodList;
    }

    public List<Food> getTopPropose() {
        List<Food> foodList = new ArrayList<>(data.values());
        foodList.sort((f1, f2) -> f2.getCreatedAt().compareTo(f1.getCreatedAt()));
        return foodList;
    }

    // Phương thức xóa món ăn
    public void deleteFood(int idFood) {
        String query = "DELETE FROM food WHERE idFood = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DbContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idFood);
            ps.executeUpdate();

            data.remove(idFood); // Xóa món ăn khỏi danh sách trong bộ nhớ
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    // phương thức thêm món ăn
    public boolean addFood(Food food) {
        String query = "INSERT INTO food (idCategory, foodName, price, discountPrice, " +
                "img, description, quantity, sold, createdAt, updatedAt, views) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DbContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, food.getIdCategory());
            ps.setString(2, food.getFoodName());
            ps.setInt(3, food.getPrice());
            ps.setObject(4, food.getDiscountPrice()); // NULL nếu không có
            ps.setString(5, food.getImg());
            ps.setString(6, food.getDescription());
            ps.setObject(7, food.getQuantity());
            ps.setInt(8, food.getSold());
            ps.setTimestamp(9, food.getCreatedAt());
            ps.setObject(10, food.getUpdatedAt());
            ps.setInt(11, food.getViews());

            int rowInserted = ps.executeUpdate();
            return rowInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            closeResources(null, ps, conn);
        }
    }

    // Phuơng thức cập nhật thông tin món ăn
    public boolean updateFood(Food food) {
        String query = "UPDATE food SET idCategory = ?, foodName = ?, price = ?, img = ?, " +
                "description = ?, updatedAt = ? WHERE idFood = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DbContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, food.getIdCategory());
            ps.setString(2, food.getFoodName());
            ps.setInt(3, food.getPrice());
            ps.setString(4, food.getImg());
            ps.setString(5, food.getDescription());
            ps.setTimestamp(6, food.getUpdatedAt());
            ps.setInt(7, food.getIdFood());

            int rowUpdated = ps.executeUpdate();
            return rowUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            closeResources(null, ps, conn);
        }
    }
}
