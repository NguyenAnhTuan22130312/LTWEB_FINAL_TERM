package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.services.AccdetailService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageCustomerController", value = "/customersevice")
public class ManageCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccdetailService accdetailService = new AccdetailService();
        List<AccDetail> listAcc = accdetailService.getAccDetails();
        request.setAttribute("listAcc", listAcc);
        request.getRequestDispatcher("views/customer_sevice.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}