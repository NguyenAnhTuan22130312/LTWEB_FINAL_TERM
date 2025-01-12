package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;
import hcmuaf.nlu.edu.vn.testproject.services.InvoiceOrderServices;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PurchaseOrderController", value = "/PurchaseOrder")
public class PurchaseOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InvoiceOrderServices invoiceOrderServices = new InvoiceOrderServices();

        String optionOrder="0";
        if(optionOrder==null)
            optionOrder= request.getParameter("optionOrder");

        List<OrderInvoice> ois = invoiceOrderServices.getOption(optionOrder);
        request.setAttribute("ois", ois);

        request.getRequestDispatcher("/views/PurchaseOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}