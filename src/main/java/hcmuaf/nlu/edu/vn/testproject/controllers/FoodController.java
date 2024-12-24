package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.daos.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.services.CategoryService;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
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

        List<Food> foodList;
        int totalFoods;

        // Lấy giá trị option từ request
        String option = request.getParameter("option");

        // Nếu có option, ưu tiên lấy dữ liệu từ option
        if (option != null && !option.isEmpty()) {
            foodList = foodServiceListFilter.getOption(option); // Lấy danh sách dựa trên option
            totalFoods = foodList.size(); // Tổng số món theo option

            // Áp dụng phân trang
            foodList = foodList.subList(
                    Math.min(offset, totalFoods),
                    Math.min(offset + pageSize, totalFoods)
            );

        } else {
            // Không có option và id danh mục => lấy toàn bộ
            foodList = foodDao.getPaginatedFoods(offset, pageSize);
            totalFoods = foodDao.getTotalFoods();
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

        // Forward đến trang JSP
        request.getRequestDispatcher("/views/allMenu.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Phương thức POST có thể được sử dụng trong tương lai khi cần thiết
    }
}
