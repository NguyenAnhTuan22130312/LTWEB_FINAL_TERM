package hcmuaf.nlu.edu.vn.testproject.controllers;


import hcmuaf.nlu.edu.vn.testproject.models.Category;
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
        // Initialize FoodDAO instance when the servlet is created
        foodDao = new FoodDAO();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response type to HTML with UTF-8 encoding
        response.setContentType("text/html;charset=UTF-8");


        // Phân trang
        int page = 1;
        int pageSize = 10;


        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }


        // Tính toán offset
        int offset = (page - 1) * pageSize;


        // Lấy danh sách món ăn đã phân trang và danh mục
        List<Food> foodList = foodDao.getPaginatedFoods(offset, pageSize); // Lấy món ăn theo phân trang
        List<Category> categoryList = foodDao.getAllCategory(); // Lấy danh mục


        int totalFoods = foodDao.getTotalFoods(); // Tổng số món ăn
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize); // Tổng số trang


        // Log kích thước của danh sách để kiểm tra
        System.out.println("Food list size: " + foodList.size());
        System.out.println("Category list size: " + categoryList.size());


        // Nếu danh sách danh mục và món ăn đều trống, hiển thị thông báo
        if (categoryList.isEmpty() && foodList.isEmpty()) {
            request.setAttribute("message", "Không có món ăn nào!");
        } else {
            // Truyền danh sách món ăn, danh mục và thông tin phân trang vào request
            request.setAttribute("list", foodList);
            request.setAttribute("listC", categoryList);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
        }


        // Chuyển tiếp đến JSP để hiển thị
        request.getRequestDispatcher("views/allMenu.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reserved for future POST handling logic
    }
}
