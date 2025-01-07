package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.daos.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.services.CategoryService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String textSearch = request.getParameter("text");
        FoodDAO dao = new FoodDAO();
        String option = request.getParameter("option");
        List<Food> foodList= new ArrayList<>();
        if(option==null)
        foodList = dao.searchByName(textSearch);


        // Lấy số trang, nếu không có thì mặc định là trang 1
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        // Tính toán offset
        int pageSize = 10; // Kích thước trang
        int offset = (page - 1) * pageSize;
        int totalFoods;

        // Lấy giá trị option từ request
        totalFoods = foodList.size(); // Tổng số món theo option

        // Áp dụng phân trang
        foodList = foodList.subList(
                Math.min(offset, totalFoods),
                Math.min(offset + pageSize, totalFoods)
        );


        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize);

        // Lấy danh sách danh mục
        CategoryService cs = new CategoryService();
        List<Category> categoryList = cs.getCategories();

        // Đặt thuộc tính cho JSP
        request.setAttribute("option", option);
        request.setAttribute("list", foodList);
        request.setAttribute("listC", categoryList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        PrintWriter out = response.getWriter();
        if(foodList.isEmpty()) out.println("<h2 style=\"max-width: 1200px; text-align: center;\"> Không có món ăn phù hợp</h2>");

        request.getRequestDispatcher("views/allMenuSearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}