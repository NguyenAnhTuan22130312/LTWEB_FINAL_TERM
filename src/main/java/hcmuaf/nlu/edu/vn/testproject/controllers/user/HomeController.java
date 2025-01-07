package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.models.Banner;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.BannerService;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BannerService bannerService = new BannerService();
        List<Banner> banners = bannerService.getBanners();
        request.setAttribute("bans", banners);
        List<Integer> countDot = new ArrayList<>();
        for (int i = 0; i < banners.size(); i++) {
            countDot.add(i);
        }
        request.setAttribute("countDot", countDot);

        FoodServiceListFilter fslf = new FoodServiceListFilter();

        List<Food> lst4View = fslf.getTop4Views();
        request.setAttribute("lst4View", lst4View);

        List<Food> lst4Sold = fslf.getTop4Sold();
        request.setAttribute("lst4Sold", lst4Sold);

        List<Food> lst4Propose = fslf.getTop4Propose();
        request.setAttribute("lst4Propose", lst4Propose);

        List<Food> lst4Rate = fslf.getTop4Rate();
        request.setAttribute("lst4Rate", lst4Rate);

        request.getRequestDispatcher("views/newhome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}