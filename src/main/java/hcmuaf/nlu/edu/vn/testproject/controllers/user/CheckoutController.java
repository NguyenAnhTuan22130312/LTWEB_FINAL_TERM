package hcmuaf.nlu.edu.vn.testproject.controllers.user;


import hcmuaf.nlu.edu.vn.testproject.daos.FoodCartDAO;
import hcmuaf.nlu.edu.vn.testproject.daos.InvoiceDAO;
import hcmuaf.nlu.edu.vn.testproject.models.*;
import hcmuaf.nlu.edu.vn.testproject.services.FoodService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {


    private FoodService foodService;


    @Override
    public void init() throws ServletException {
        foodService = new FoodCartDAO();
        super.init();


    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Kiểm tra xem người dùng đã đăng nhập chưa (kiểm tra session attribute "currentUser")
        Account currentUser = (Account) session.getAttribute("currentUser");

        if (currentUser == null) {

            response.sendRedirect("login");
        } else {
            // Nếu người dùng đã đăng nhập, tiếp tục với việc thanh toán
            Order order = (Order) session.getAttribute("order");

            if (order == null || order.getItems().isEmpty()) {
                response.sendRedirect("cart"); // Nếu giỏ hàng trống, chuyển về giỏ hàng
            } else {
                // Tính toán tổng tiền và truyền dữ liệu đến trang thanh toán
                int totalAmount = 0;
                for (Item item : order.getItems()) {
                    totalAmount += item.getQuantity() * item.getFood().getPrice();
                }
                request.setAttribute("order", order);
                request.setAttribute("totalAmount", totalAmount);
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/check-out.jsp");
                dispatcher.forward(request, response);
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form và session
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("currentUser");

        int idAcc = currentUser.getIdAcc();


        // id của tài khoản từ session
        String recipientName = request.getParameter("tennguoinhan");
        String phoneNumber = request.getParameter("sdtnhan");
        String deliveryAddress = request.getParameter("diachinhan");


        String note = request.getParameter("note-order");
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));

        // Tạo thời gian hiện tại (ngày giờ)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String orderDate = sdf.format(new Date());

        // Tạo đối tượng Invoice từ thông tin form
        Invoice invoice = new Invoice();
        invoice.setIdAcc(idAcc);
        invoice.setRecipientName(recipientName);
        invoice.setPhoneNumber(phoneNumber);
        invoice.setDeliveryAddress(deliveryAddress);
        invoice.setNote(note);
        invoice.setOrderDate(orderDate);
        invoice.setTotalAmount(totalAmount);
        invoice.setPaymentMethod(paymentMethod);

        // Khởi tạo DAO để lưu thông tin vào database
        InvoiceDAO invoiceDAO = new InvoiceDAO();

        try {
            // Thêm hóa đơn vào cơ sở dữ liệu
            invoiceDAO.addInvoice(invoice);

            // Giả sử bạn đã có thông tin chi tiết đơn hàng (InvoiceDetail)
            // Đây là ví dụ đơn giản, bạn có thể lấy thông tin từ giỏ hàng và các chi tiết tương ứng
            InvoiceDetail detail = new InvoiceDetail();
            detail.setIdInvoice(invoice.getIdInvoice());  // ID của hóa đơn vừa thêm
            detail.setIdFood(1);  // Ví dụ về ID món ăn
            detail.setQuantity(2);  // Số lượng
            detail.setTotalAmount(100000);  // Tổng tiền cho món ăn này

            // Thêm chi tiết hóa đơn vào cơ sở dữ liệu
            invoiceDAO.addInvoiceDetail(detail);

            // Sau khi thêm thành công, chuyển hướng đến trang thành công
            response.sendRedirect("home");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp?error=true");
        }
    }

}
