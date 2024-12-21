package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.daos.LoginDAO;
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
        String password = request.getParameter("pass");

        //thực hiện sign up
        LoginDAO loginDAO = new LoginDAO();
        Account account = loginDAO.checkUserExist(username);
        //nếu như chưa có tên người dùng nào
        if (account == null) {
            loginDAO.signUp(username, password);
            response.sendRedirect("allmenu");

        }else {
            request.setAttribute("errorMessage", "Tên người dùng đã tồn tại.");
            request.getRequestDispatcher("views/signin.jsp").forward(request, response);
        }

    }
}