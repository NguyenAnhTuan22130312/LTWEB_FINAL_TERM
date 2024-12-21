package hcmuaf.nlu.edu.vn.testproject.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutController", value = "/LogoutController")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Lấy session hiện tại (không tạo mới nếu null)
        if (session != null) {
            session.invalidate(); // Hủy session
        }
        response.sendRedirect("views/allMenu.jsp"); // Chuyển về trang đăng nhập
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}