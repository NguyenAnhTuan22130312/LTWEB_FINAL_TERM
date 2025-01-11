package hcmuaf.nlu.edu.vn.testproject.controllers.user;

import hcmuaf.nlu.edu.vn.testproject.daos.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AjaxSearchController", value = "/AjaxSearchController")
public class AjaxSearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String textSearch = request.getParameter("text");
        FoodDAO dao = new FoodDAO();
        List<Food> foodList = dao.searchByName(textSearch);
        request.setAttribute("list", foodList);

        PrintWriter out = response.getWriter();
        if(foodList.isEmpty())
            out.println("<h2 style=\"max-width: 1200px; text-align: center;\"> Không có món ăn phù hợp</h2>");
        else {
            out.println("<div class=\"content_section\">");
            for (Food food : foodList) {

                out.println("<div class=\"card\" onclick=\"showPopup('" + food.getIdFood() + "')\">\n" +
                        "                <img src=\"" + food.getImg() + "\" alt=\"" + food.getFoodName() + "\"/>\n" +
                        "                <div class=\"card_content\">\n" +
                        "                    <h3>" + food.getFoodName() + "</h3>\n" +
                        "                    <p>" + food.getPrice() + "đ</p>\n" +
                        "                    <c:url value=\"addtoCart?foodID=" + food.getIdFood() + "\" var=\"addtoCart\"/>\n" +
                        "                    <a class=\"btn\" href=\"${addtoCart}\">\n" +
                        "                        Thêm vào giỏ hàng\n" +
                        "                    </a>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "\n" +
                        "            <!-- Popup chi tiết món ăn -->\n" +
                        "            <div id=\"" + food.getIdFood() + "\" class=\"popup\">\n" +
                        "                <div class=\"popup-content\">\n" +
                        "                    <img src=\"" + food.getImg() + "\" alt=\"" + food.getFoodName() + "\"/>\n" +
                        "                    <h3>" + food.getFoodName() + "</h3>\n" +
                        "                    <p>Giá: " + food.getPrice() + "đ</p>\n" +
                        "                    <span>\n" +
                        "                           " + food.getDescription() + "\n" +
                        "                    </span>\n" +
                        "                    <button class=\"button-cart\">\n" +
                        "\n" +
                        "                        <a class=\"linktocart\" href=\"${addtoCart}\" onclick=\"event.stopPropagation()\">\n" +
                        "                            Thêm vào giỏ hàng\n" +
                        "                        </a>\n" +
                        "                    </button>\n" +
                        "                </div>\n" +
                        "                <span class=\"close\" onclick=\"closePopup('" + food.getIdFood() + "')\">&times;</span>\n" +
                        "            </div>");
            }
            out.println("</div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}