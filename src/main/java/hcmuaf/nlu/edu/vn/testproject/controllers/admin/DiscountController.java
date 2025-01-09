package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.models.Discount;
import hcmuaf.nlu.edu.vn.testproject.services.DiscountService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DiscountController", value = "/discount")
public class DiscountController extends HttpServlet {
    DiscountService discountService = new DiscountService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<Discount> discounts = discountService.getAllDiscounts();
        request.setAttribute("discounts", discounts);
        request.getRequestDispatcher("views/discount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}