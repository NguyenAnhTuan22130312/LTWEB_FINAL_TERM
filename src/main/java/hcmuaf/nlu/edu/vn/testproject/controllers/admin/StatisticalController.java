package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.daos.InvoiceDAO;
import hcmuaf.nlu.edu.vn.testproject.models.InvoiceDetail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StatisticalController", value = "/statistical")
public class StatisticalController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InvoiceDAO dao = new InvoiceDAO();
        List<InvoiceDetail> invoiceDetails = dao.getInvoiceDetails();

        int totalProducts = invoiceDetails.size();
        int totalQuantity = 0;
        int totalPrice = 0;

        for (InvoiceDetail invoiceDetail : invoiceDetails) {
            totalQuantity += invoiceDetail.getQuantity();
            totalPrice += invoiceDetail.getTotalAmount();

        }

        request.setAttribute("invoiceDetails", invoiceDetails);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalQuantity", totalQuantity);
        request.setAttribute("totalRevenue", totalPrice);
        request.getRequestDispatcher("views/statistical.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}