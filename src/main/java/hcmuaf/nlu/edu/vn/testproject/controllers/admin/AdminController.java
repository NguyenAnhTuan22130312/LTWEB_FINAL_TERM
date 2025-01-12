package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.daos.InvoiceDAO;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.models.InvoiceDetail;
import hcmuaf.nlu.edu.vn.testproject.services.AccdetailService;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("currentUser");

        if (currentUser == null || currentUser.getIdRole() == 2) {
            // Chuyển hướng về trang home nếu người dùng chưa đăng nhập
            response.sendRedirect("home");
            return;
        }

        FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();
        AccdetailService accdetailService = new AccdetailService();
        try {
            // Lấy danh sách tất cả món ăn
            List<Food> allFood = foodServiceListFilter.getOption("tatca");
            int totalFoods = allFood.size();

            // Lấy danh sách 4 món bán chạy nhất
            List<Food> lst4Sold = foodServiceListFilter.getTop4Sold();

            // Lấy số lương khách hàng
            List<AccDetail> allAcc = accdetailService.getAccDetails();
            int totalAcc = allAcc.size();

            // Lấy doanh thu trong thống kê
            InvoiceDAO dao = new InvoiceDAO();
            List<InvoiceDetail> invoiceDetails = dao.getInvoiceDetails();
            int totalPrice = 0;
            for (InvoiceDetail invoiceDetail : invoiceDetails) {
                totalPrice += invoiceDetail.getTotalAmount();

            }

            // Gán dữ liệu vào request
            request.setAttribute("totalFoods", totalFoods);
            request.setAttribute("totalAccs", totalAcc);
            request.setAttribute("lst4Sold", lst4Sold);
            request.setAttribute("totalRevenue", totalPrice);

            // Chuyển hướng đến trang admin.jsp
            request.getRequestDispatcher("views/admin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình xử lý.");
            request.getRequestDispatcher("views/admin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}