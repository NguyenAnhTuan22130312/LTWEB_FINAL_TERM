package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        FoodServiceListFilter fslf = new FoodServiceListFilter();

        List<Food> lst4View = fslf.getTop4Views();
        request.setAttribute("lst4View", lst4View);

        List<Food> lst4Sold= fslf.getTop4Sold();
        request.setAttribute("lst4Sold", lst4Sold);

        List <Food> lst4Propose=fslf.getTop4Propose();
        request.setAttribute("lst4Propose", lst4Propose);

        List <Food> lst4Rate=fslf.getTop4Rate();
        request.setAttribute("lst4Rate", lst4Rate);

        request.getRequestDispatcher("views/newhome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}