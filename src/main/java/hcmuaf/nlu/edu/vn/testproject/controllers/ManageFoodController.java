package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.CategoryService;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ManageFoodController", value = "/foodservice")
public class ManageFoodController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();

        // Lấy số trang, nếu không có thì mặc định là trang 1
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Tính toán offset
        int pageSize = 10; // Kích thước trang
        int offset = (page - 1) * pageSize;
        List<Food> foodList = new ArrayList<>();
        int totalFoods = 0;

        // Lấy giá trị option từ request
        String option = request.getParameter("option");
        if (option == null || option.isEmpty()) {
            option = "tatca"; // Mặc định là "Tất cả"
        }

        // Lấy danh sách món ăn dựa trên danh mục được chọn
        if ("tatca".equals(option)) {
            foodList = foodServiceListFilter.getOption("tatca"); // Lấy tất cả món ăn
        } else {
            foodList = foodServiceListFilter.getOption(option); // Lấy danh sách dựa trên danh mục
        }
        totalFoods = foodList.size();

        // Áp dụng phân trang
        if (offset < totalFoods) {
            foodList = foodList.subList(
                    Math.min(offset, totalFoods),
                    Math.min(offset + pageSize, totalFoods)
            );
        } else {
            foodList = new ArrayList<>(); // Trả về danh sách rỗng nếu offset vượt tổng số món
        }

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize);

        // Lấy danh sách danh mục
        CategoryService cs = new CategoryService();
        List<Category> categoryList = cs.getCategories();

        // Đặt thuộc tính cho JSP
        request.setAttribute("list", foodList);
        request.setAttribute("listC", categoryList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentCategory", option); // Truyền danh mục hiện tại

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("/views/food_service.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}