package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.daos.LoginDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Tên người dùng và mật khẩu không được để trống");
            request.getRequestDispatcher("views/signin.jsp").forward(request, response);
            return;
        }

        LoginDAO dao = new LoginDAO();
        Account account = dao.login(username, password);
        if (account == null) {
            // Nếu đăng nhập không thành công, quay lại trang đăng nhập
            request.setAttribute("error", "Đăng nhập không thành công");
            request.getRequestDispatcher("views/signin.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", account);
            response.sendRedirect("home");
        }

    }
}