package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.daos.AccdetailDAO;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AccDetailController", value = "/AccDetail")
public class AccDetailController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("currentUser");

        if (currentUser != null) {
            int userId = currentUser.getIdAcc();  // Lấy ID từ session
            // Sử dụng userId để thực hiện các thao tác với dữ liệu người dùng
            // Ví dụ, lấy thông tin tài khoản và chi tiết tài khoản
            AccdetailDAO accountDAO = new AccdetailDAO();
            Account account = accountDAO.getAccountById(userId);
            AccDetail accDetail = accountDAO.getAccDetailById(userId);

            if (account != null && accDetail != null) {
                request.setAttribute("account", account);
                request.setAttribute("accDetail", accDetail);
                request.getRequestDispatcher("views/UserInformation.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin tài khoản.");
                request.getRequestDispatcher("views/UserInformation.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("views/signin.jsp");  // Nếu không có session, chuyển hướng đến trang đăng nhập
        }
    }
    }



