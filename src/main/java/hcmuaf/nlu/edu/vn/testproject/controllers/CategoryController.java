package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/categories")
public class CategoryController extends HttpServlet {

    private FoodDAO dao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Phân trang
        int page = 1;
        int pageSize = 10;


        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }


        // Tính toán offset
        int offset = (page - 1) * pageSize;

        String idCate = request.getParameter("idc");

        dao = new FoodDAO();

        List<Food> listP = dao.getFoodByIdCategory(Integer.parseInt(idCate));
        List<Food> listPPaginated = listP.subList(Math.min(offset, listP.size()), Math.min(offset + pageSize, listP.size()));

        int totalFoods = listP.size(); // Số món trong danh mục
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize); // Tổng số trang
        List<Category> listC = dao.getAllCategoryFood(); // Lấy danh mục

        request.setAttribute("list", listPPaginated);
        request.setAttribute("listC", listC);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Chuyển tiếp đến JSP để hiển thị
        request.getRequestDispatcher("views/allMenu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}