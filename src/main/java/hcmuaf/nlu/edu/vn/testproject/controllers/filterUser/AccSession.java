package hcmuaf.nlu.edu.vn.testproject.controllers.filterUser;

import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.services.InvoiceOrderServices;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AccSession")
public class AccSession implements Filter {

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

            session.setAttribute("currentUser", acc);
        }

        chain.doFilter(request, response);
    }
}