package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;
import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoiceDetail;
import hcmuaf.nlu.edu.vn.testproject.services.InvoiceOrderServices;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PurchaseOrderAjaxControler", value = "/PurchaseOrderAjaxControler")
public class PurchaseOrderAjaxControler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InvoiceOrderServices invoiceOrderServices = new InvoiceOrderServices();

        String optionOrder = request.getParameter("text");
        if (optionOrder == null) {
            optionOrder = "0";
        }


        List<OrderInvoice> ois = invoiceOrderServices.getOption(optionOrder);
        request.setAttribute("ois", ois);

        PrintWriter out = response.getWriter();
        if (ois.isEmpty()) {
            out.println("<h2 style=\"max-width: 1200px; text-align: center;\"> Không có món ăn phù hợp</h2>");
        } else {

            for (OrderInvoice oi : ois) {
                String formattedId = String.format("%06d", oi.getIdInvoice());
                String orderst = "";
                if (oi.getOrderSt() == 1) orderst = "Đang giao";
                if (oi.getOrderSt() == 2) orderst = "Đã giao";
                if (oi.getOrderSt() == 3) orderst = "Đã hủy";
                out.println(
                        "            <div class=\"order-container\">\n" +
                                "                <div class=\"order-card\">\n" +
                                "                    <div class=\"idDonHang\">\n" +
                                "                        <i class=\"fa-regular fa-copy\"></i> " + formattedId + "\n" +
                                "                    </div>\n" +
                                "                    <div class=\"line_st\"></div>\n");
                for (OrderInvoiceDetail oid : oi.getOrderInvoiceDetail()) {
                    out.println(
                            "                        <div class=\"product-item\">\n" +
                                    "                            <img\n" +
                                    "                                    src=\"" + oid.getImg() + "\"\n" +
                                    "                                    class=\"product-image\"\n" +
                                    "                            />\n" +
                                    "                            <div class=\"product-info\">\n" +
                                    "                                <h3 class=\"product-name\">" + oid.getFoodName() + "</h3>\n" +
                                    "                                <p class=\"product-quantity\">Số lượng: " + oid.getQuantity() + "</p>\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"product-total\">\n" +
                                    "                                <div class=\"money\">" + oid.getTotalAmount() + "&nbsp;đ</div>\n" +
                                    "                            </div>\n" +
                                    "                        </div>\n"
                    );
                }
                out.println("\n" +
                        "                    <div class=\"line_end\"></div>\n" +
                        "                    <div class=\"order-total\">\n" +
                        "                        <strong>Tổng tiền:</strong>\n" +
                        "                        <span class=\"total-money\">" + oi.getTotalAmount() + "&nbsp;đ</span>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"order-footer\">\n" +
                        "                        <div class=\"order-status\">Trạng thái: " + orderst + " </div>\n");
                if(oi.getOrderSt()==1)out.println("<a class=\"info-order-button\" href=\"PurchaseOrderDetail?id=${iorder.idInvoice}\" style=\"text-decoration: none\">Chi tiết</a>\n" +
                        "    <button class=\"cancel-order-button\">Hủy đơn hàng</button>");
                if(oi.getOrderSt()==2||oi.getOrderSt()==3)out.println("<a class=\"info-order-button\" href=\"PurchaseOrderDetail?id=${iorder.idInvoice}\" style=\"text-decoration: none\">Chi tiết</a>");
                out.println("                    </div>\n" +
                        "                </div>\n" +
                        "            </div>\n"
                );
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}