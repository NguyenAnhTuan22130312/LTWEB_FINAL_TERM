package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

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

        FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();
        try {
            // Lấy danh sách tất cả món ăn
            List<Food> allFood = foodServiceListFilter.getOption("tatca");
            int totalFoods = allFood.size();

            // Lấy danh sách 4 món bán chạy nhất
            List<Food> lst4Sold = foodServiceListFilter.getTop4Sold();

            // Gán dữ liệu vào request
            request.setAttribute("totalFoods", totalFoods);
            request.setAttribute("lst4Sold", lst4Sold);

            // Chuyển hướng đến trang admin.jsp
            request.getRequestDispatcher("views/admin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình xử lý.");
            request.getRequestDispatcher("views/admin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}