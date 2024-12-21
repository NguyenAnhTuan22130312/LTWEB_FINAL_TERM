package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.dao.FoodDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "PagiController", value = "/PagiController")
public class PagiController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 10;

        // Lấy tham số trang từ URL nếu có
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Tính toán offset
        int offset = (page - 1) * pageSize;

        FoodDAO foodDAO = new FoodDAO();
        List<Food> foodList = foodDAO.getPaginatedFoods(offset, pageSize);
        int totalFoods = foodDAO.getTotalFoods();
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize);

        // Đưa dữ liệu vào request attribute
        request.setAttribute("list", foodList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Forward tới JSP
        request.getRequestDispatcher("views/allMenu.jsp").forward(request, response);
    }
}