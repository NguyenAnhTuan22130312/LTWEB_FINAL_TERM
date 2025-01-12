package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;
import hcmuaf.nlu.edu.vn.testproject.services.InvoiceOrderServices;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CancelBtnController", value = "/CancelBtnController")
public class CancelBtnController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InvoiceOrderServices invoiceOrderServices = new InvoiceOrderServices();
        String id = request.getParameter("id");
        if(id!=null){
            invoiceOrderServices.cancelInvoice(id);
        }
        request.getRequestDispatcher("PurchaseOrder").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}