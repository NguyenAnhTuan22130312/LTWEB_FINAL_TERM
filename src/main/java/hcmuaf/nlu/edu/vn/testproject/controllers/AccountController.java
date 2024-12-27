package hcmuaf.nlu.edu.vn.testproject.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AccountController", value = "/user")
public class AccountController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAcc = request.getParameter("idAcc");
        if (idAcc != null) {
            // Chuyển tiếp yêu cầu đến AccDetailController
            request.setAttribute("idAcc", idAcc);
            request.getRequestDispatcher("AccDetail").forward(request, response);
        } else {
            // Nếu không có idAcc, có thể điều hướng đến trang mặc định hoặc trang lỗi
            response.sendRedirect("views/UserInformation.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}