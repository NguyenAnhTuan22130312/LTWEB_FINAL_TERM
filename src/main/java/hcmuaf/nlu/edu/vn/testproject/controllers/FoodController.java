package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FoodController", value = "/allmenu")
public class FoodController extends HttpServlet {

    private FoodDAO foodDao;

    @Override
    public void init() throws ServletException {
        // Khởi tạo đối tượng FoodDAO khi servlet được khởi tạo
        foodDao = new FoodDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thiết lập kiểu dữ liệu trả về là HTML với mã hóa UTF-8
        response.setContentType("text/html;charset=UTF-8");

        // Lấy danh sách món ăn từ cơ sở dữ liệu thông qua FoodDAO
        List<Food> foodList = foodDao.getAll();

        // Kiểm tra danh sách món ăn
        System.out.println("Food list size: " + foodList.size());

        // Nếu không có món ăn nào trong danh sách, hiển thị thông báo
        if (foodList.isEmpty()) {
            request.setAttribute("message", "Không có món ăn nào!");
        } else {
            // Đưa danh sách món ăn vào request để chuyển qua trang JSP
            request.setAttribute("list", foodList);
        }

        // Chuyển tiếp đến trang JSP để hiển thị kết quả
        request.getRequestDispatcher("views/allMenu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Phương thức POST có thể được sử dụng trong tương lai khi cần thiết
    }


}
