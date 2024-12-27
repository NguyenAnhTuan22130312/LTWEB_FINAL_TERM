package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.daos.AccdetailDAO;
import hcmuaf.nlu.edu.vn.testproject.models.AccDetail;
import hcmuaf.nlu.edu.vn.testproject.services.AccDetailService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AccDetailController", value = "/AccDetail")
public class AccDetailController extends HttpServlet {
    private AccDetailService accDetailService;

    @Override
    public void init() throws ServletException {
        accDetailService = new AccdetailDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAcc = Integer.parseInt(request.getParameter("idAcc"));
        AccDetail accDetail = accDetailService.getAccountById(idAcc);
        request.setAttribute("accDetail", accDetail);
        request.getRequestDispatcher("views/UserInfomation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAccStr = request.getParameter("idAcc");

        // Kiểm tra nếu idAcc bị null hoặc không hợp lệ
        if (idAccStr == null || idAccStr.isEmpty()) {
            // Xử lý lỗi hoặc thông báo cho người dùng
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu thông tin idAcc.");
            return;
        }

        try {
            int idAcc = Integer.parseInt(idAccStr);
            // Tiếp tục xử lý với idAcc
            AccDetail accDetail = accDetailService.getAccountById(idAcc);
            request.setAttribute("accDetail", accDetail);
            request.getRequestDispatcher("viewAccDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu idAcc không phải số nguyên
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "idAcc không hợp lệ.");
        }
    }

}