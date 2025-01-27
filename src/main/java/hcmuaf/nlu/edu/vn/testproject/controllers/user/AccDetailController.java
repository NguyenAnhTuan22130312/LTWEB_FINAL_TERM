package hcmuaf.nlu.edu.vn.testproject.controllers.user;

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


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String birthDate = request.getParameter("birthDate");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        // Lấy đối tượng Account từ session
        Account account = (Account) request.getSession().getAttribute("currentUser");  // Sử dụng "currentUser"

        if (account != null) {
            // Lấy thông tin chi tiết tài khoản (AccDetail) từ Account
            AccDetail accDetail = account.getAccDetail();

            if (accDetail == null) {
                // Nếu chưa có AccDetail, tạo mới AccDetail
                accDetail = new AccDetail();
            }

            // Cập nhật thông tin người dùng vào AccDetail
            accDetail.setFullName(fullName);
            accDetail.setPhoneNumber(phoneNumber);
            accDetail.setAddress(address);
            accDetail.setBirthDate(birthDate);
            accDetail.setGender(Integer.parseInt(gender));

            // Cập nhật thông tin vào cơ sở dữ liệu (cập nhật hoặc tạo mới AccDetail)
            AccdetailDAO accdetailDAO = new AccdetailDAO();
            if (accDetail.getIdAcc() == 0) {
                // Nếu chưa có AccDetail trong cơ sở dữ liệu (ID = 0), thêm mới
                accdetailDAO.addAccDetail(account.getIdAcc(), fullName, address, phoneNumber, birthDate, Integer.parseInt(gender));
            } else {
                // Nếu đã có AccDetail, thực hiện cập nhật
                accdetailDAO.updateAccdetail(account.getIdAcc(), fullName, address, phoneNumber, birthDate, Integer.parseInt(gender));
            }

            // Cập nhật lại thông tin trong session
            account.setAccDetail(accDetail);  // Cập nhật lại thông tin AccDetail trong Account
            request.getSession().setAttribute("currentUser", account);  // Lưu lại thông tin tài khoản với AccDetail đã cập nhật

            // Chuyển hướng đến trang thông tin người dùng sau khi cập nhật
            response.sendRedirect("AccDetail");
        } else {
            response.getWriter().write("Không tìm thấy tài khoản trong session.");
        }
    }

}



