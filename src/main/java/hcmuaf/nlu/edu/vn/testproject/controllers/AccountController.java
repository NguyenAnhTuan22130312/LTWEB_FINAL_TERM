package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.services.AccountService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AccountController", value = "/user")
public class AccountController extends HttpServlet {
    private final AccountService accService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("views/UserInformation.jsp").forward(request, response);
//        HttpSession session = request.getSession();
//        Integer userId = (Integer) session.getAttribute("userId");
//
//        if (userId == null) {
//            response.sendRedirect("login");
//            return;
//        }
//
//        AccDetail user = accService.getUserById(userId);
//
//        if (user != null) {
//            request.setAttribute("user", user);
//        } else {
//            response.sendRedirect("login");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Integer userId = (Integer) session.getAttribute("userId");
//        if (userId == null) {
//            response.sendRedirect("login");
//            return;
//        }
//
//        String fullName = request.getParameter("fullName");
//        String phoneNumber = request.getParameter("phoneNumber");
//        String address = request.getParameter("address");
//        int gender = Integer.parseInt(request.getParameter("gender"));
//        String birthDate = request.getParameter("birthDate");
//
//        AccDetail user = new AccDetail(userId, fullName, phoneNumber, null, address, gender, birthDate);
//        boolean isUpdated = accService.updateUser(user);
//
//        if (isUpdated) {
//            response.sendRedirect("user");
//        } else {
//            request.setAttribute("errorMessage", "Cập nhật thông tin thất bại!");
//            request.getRequestDispatcher("views/UserInformation.jsp").forward(request, response);
//        }
    }
}