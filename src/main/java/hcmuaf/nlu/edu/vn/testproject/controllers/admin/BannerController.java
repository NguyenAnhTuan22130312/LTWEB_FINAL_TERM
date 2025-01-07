package hcmuaf.nlu.edu.vn.testproject.controllers.admin;

import hcmuaf.nlu.edu.vn.testproject.models.Banner;
import hcmuaf.nlu.edu.vn.testproject.services.BannerService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BannerController", value = "/banner")
public class BannerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerService bannerService = new BannerService();
        List<Banner> banners = bannerService.getBanners();
        request.setAttribute("bans", banners);
        request.getRequestDispatcher("views/banner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}