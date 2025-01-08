package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.daos.FoodCartDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Item;
import hcmuaf.nlu.edu.vn.testproject.models.Order;
import hcmuaf.nlu.edu.vn.testproject.services.FoodService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    private FoodService foodService;

    @Override
    public void init() throws ServletException {
        foodService = new FoodCartDAO();
        super.init();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order == null || order.getItems().isEmpty()) {
            response.sendRedirect("cart"); // Nếu giỏ hàng trống, chuyển về giỏ hàng
        } else {
            // Truyền giỏ hàng và tổng tiền tới trang thanh toán
            int totalAmount = 0;
            for (Item item : order.getItems()) {
                totalAmount += item.getQuantity() * item.getFood().getPrice();
            }
            request.setAttribute("order", order);
            request.setAttribute("totalAmount", totalAmount);
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/check-out.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}