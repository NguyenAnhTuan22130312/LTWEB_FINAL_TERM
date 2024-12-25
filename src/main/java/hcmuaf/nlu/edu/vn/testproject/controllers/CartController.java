package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.daos.FoodCartDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Item;
import hcmuaf.nlu.edu.vn.testproject.models.Order;
import hcmuaf.nlu.edu.vn.testproject.services.FoodService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private FoodService foodService;

    @Override
    public void init() throws ServletException {
        foodService = new FoodCartDAO();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/cart.jsp");
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        int totalItems = 0;
        if (order != null) {
            for (Item item : order.getItems()) {
                totalItems += item.getQuantity();
            }
        }
        session.setAttribute("totalItems", totalItems);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        super.doPost(request, response);
    }
}