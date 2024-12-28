package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.daos.AccountDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.services.ResetPassService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ForgotPassController", value = "/forgotpass")
public class ForgotPassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO account = new AccountDAO();
        String email = request.getParameter("email");
        // Kiểm tra email có tổn tại trong db
        Account user = account.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess", "email does not exist");
            request.getRequestDispatcher("views/forgot_pass.jsp").forward(request, response);
            return;
        }

        // Tạo token đặt lại mật khẩu
        String token = ResetPassService.generateResetToken();
        ResetPassService.storeToken(user.getIdAcc(), token);

        // Gửi email
        String resetLink = "http://localhost:8080/testproject/resetpassword?token=" + token;
        String subject = "Đặt lại mật khẩu của bạn";
        String content = "Nhấn vào liên kết sau để đặt lại mật khẩu: " + resetLink;
        ResetPassService.sendEmail(email, subject, content);

        request.setAttribute("mess", "Email đặt lại mật khẩu đã được gửi!");
        request.getRequestDispatcher("views/forgot_pass.jsp").forward(request, response);
    }
}