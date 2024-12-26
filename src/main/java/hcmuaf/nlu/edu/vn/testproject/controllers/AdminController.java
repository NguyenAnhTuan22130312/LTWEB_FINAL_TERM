package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();
        // Lấy tổng số món
        List<Food> allFood = foodServiceListFilter.getOption("tatca");
        int totalFoods = allFood.size();

        // Lấy món ăn bán chạy nhất
        List<Food> lst4Sold = foodServiceListFilter.getTop4Sold();
        request.setAttribute("totalFoods", totalFoods);
        request.setAttribute("lst4Sold", lst4Sold);
        request.getRequestDispatcher("views/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}