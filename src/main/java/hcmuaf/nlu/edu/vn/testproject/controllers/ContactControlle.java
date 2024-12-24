package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.services.ContactService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ContactControlle", value = "/contactcontrolle")
public class ContactControlle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("views/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //khi nào chạy được session thì xóa command
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        Int id = account.getIdAcc();
        int id= 1;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        ContactService cs = new ContactService();
        cs.sendContactSV(id, name, email, title, message);
        request.getRequestDispatcher("views/contact.jsp").forward(request, response);
    }
}