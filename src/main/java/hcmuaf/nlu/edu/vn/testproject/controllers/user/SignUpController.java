package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.daos.SignUpDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/signup")
public class SignUpController extends HttpServlet {

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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        if (username == null || password == null || email == null || username.trim().isEmpty() || password.trim().isEmpty() || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("views/signin.jsp").forward(request, response);
            return;
        }

        Account account = SignUpDAO.checkUserExist(username,email);
        //nếu như chưa có tên người dùng nào
        if (account == null) {
            SignUpDAO.signUp(username, password, email);
            response.sendRedirect("login");

        }else {
            String errorMessage;
            if (account.getUserName().equals(username)) {
                errorMessage = "Tên người dùng đã tồn tại.";
            } else {
                errorMessage = "Email đã được sử dụng.";
            }

            request.setAttribute("errorMessage", errorMessage);
            System.out.println("Error Message: " + request.getAttribute("errorMessage"));
            request.getRequestDispatcher("views/signin.jsp").forward(request, response);
        }

    }
}