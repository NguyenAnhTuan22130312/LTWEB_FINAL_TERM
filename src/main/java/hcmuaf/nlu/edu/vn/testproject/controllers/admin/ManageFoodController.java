package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.daos.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
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
    FoodDAO foodDAO = new FoodDAO();
    CategoryService cs = new CategoryService();
    FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("currentUser");

        if (currentUser.getIdRole() == 2) {
            // Chuyển hướng về trang home nếu người dùng chưa đăng nhập
            response.sendRedirect("home");
            return;
        }

        String txtSearch = request.getParameter("text");  // Lấy từ khóa tìm kiếm từ form

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

        // Nếu có từ khóa tìm kiếm
        if (txtSearch != null && !txtSearch.isEmpty()) {
            // Tìm kiếm theo tên món ăn
            foodList = foodDAO.searchByName(txtSearch);
        } else {
            // Nếu không có tìm kiếm, lấy danh sách món ăn theo danh mục
            if ("tatca".equals(option)) {
                foodList = foodServiceListFilter.getOption("tatca"); // Lấy tất cả món ăn
            } else {
                foodList = foodServiceListFilter.getOption(option); // Lấy món ăn theo danh mục
            }
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
        List<Category> categoryList = cs.getCategories();

        // Đặt thuộc tính cho JSP
        request.setAttribute("list", foodList);
        request.setAttribute("listC", categoryList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentCategory", option); // Truyền danh mục hiện tại
        request.setAttribute("search", txtSearch);

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("views/food_service.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int idFood = Integer.parseInt(request.getParameter("idFood"));
            foodServiceListFilter.deleteFood(idFood);
            response.sendRedirect("foodservice");
        } else if ("add".equals(action)) {
            String name = request.getParameter("foodName");
            int category = Integer.parseInt(request.getParameter("idCategory"));
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            String img = request.getParameter("img");

            Food newFood = new Food(0, name, price, 0, 0, img, description, category, 0, 0, 0, null, null);
            foodServiceListFilter.addFood(newFood);
            response.sendRedirect("foodservice");

        }
    }
}