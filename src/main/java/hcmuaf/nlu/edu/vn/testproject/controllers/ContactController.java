package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.services.ContactService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ContactController", value = "/contact-controll")
public class ContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("currentUser");

        try {
            int id = account.getIdAcc();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String title = request.getParameter("title");
            String message = request.getParameter("message");

            ContactService cs = new ContactService();
            cs.sendContactSV(id, name, email, title, message);

            response.getWriter().write("Gửi liên hệ thành công!");
        } catch (Exception e) {

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Đã xảy ra lỗi khi gửi liên hệ.");
        }
    }
}