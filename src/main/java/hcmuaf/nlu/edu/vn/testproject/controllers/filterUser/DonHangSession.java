package hcmuaf.nlu.edu.vn.testproject.controllers.filterUser;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import hcmuaf.nlu.edu.vn.testproject.services.InvoiceOrderServices;
import jakarta.servlet.http.*;

@WebFilter(filterName = "DonHangSession")
public class DonHangSession implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();

        if (session.getAttribute("currentUser") != null) {
            Account acc = (Account) session.getAttribute("currentUser");
            InvoiceOrderServices invoiceOrderServices = new InvoiceOrderServices(acc.getIdAcc());
            int totaldh = invoiceOrderServices.getTotalDonHang();
            session.setAttribute("totaldh", totaldh);
        }
        if (session.getAttribute("currentUser") == null) {

            int totaldh = 0;
            session.setAttribute("totaldh", totaldh);
        }

        chain.doFilter(request, response);
    }
}