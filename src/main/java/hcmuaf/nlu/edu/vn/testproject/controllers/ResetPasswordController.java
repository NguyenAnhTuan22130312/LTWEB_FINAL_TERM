package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.daos.AccountDAO;
import hcmuaf.nlu.edu.vn.testproject.services.ResetPassService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/resetpassword")
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");

        int userId = ResetPassService.getUserIdByToken(token);
        if (userId == -1) {
            request.setAttribute("mess", "Token không hợp lệ hoặc đã hết hạn");
            request.getRequestDispatcher("views/reset_pass.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        accountDAO.updatePassword(userId, newPassword);

        request.setAttribute("mess", "Mật khẩu đã được cập nhật thành công");
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    }
}