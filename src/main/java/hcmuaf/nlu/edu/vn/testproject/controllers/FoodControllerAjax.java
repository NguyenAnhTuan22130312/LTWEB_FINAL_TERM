package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Category;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.CategoryService;
import hcmuaf.nlu.edu.vn.testproject.services.FoodServiceListFilter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FoodControllerAjax", value = "/menuajax")
public class FoodControllerAjax extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        FoodServiceListFilter foodServiceListFilter = new FoodServiceListFilter();

        // Lấy số trang, nếu không có thì mặc định là trang 1
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        // Tính toán offset
        int pageSize = 10; // Kích thước trang
        int offset = (page - 1) * pageSize;
        List<Food> foodList= new ArrayList<>();
        int totalFoods=0;

        // Lấy giá trị option từ request
        String option = request.getParameter("option");
        if (option != null) {

            foodList = foodServiceListFilter.getOption(option); // Lấy danh sách dựa trên option
            totalFoods = foodList.size(); // Tổng số món theo option

            // Áp dụng phân trang
            foodList = foodList.subList(
                    Math.min(offset, totalFoods),
                    Math.min(offset + pageSize, totalFoods)
            );
        }else{
            response.sendRedirect(request.getContextPath() + "/search");
        }

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalFoods / pageSize);

        // Lấy danh sách danh mục
        CategoryService cs = new CategoryService();
        List<Category> categoryList = cs.getCategories();

        // Đặt thuộc tính cho JSP
        request.setAttribute("list", foodList);
        request.setAttribute("listC", categoryList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);


        PrintWriter out = response.getWriter();
        if(foodList.isEmpty())
            out.println("<h2 style=\"max-width: 1200px; text-align: center;\"> Không có món ăn phù hợp</h2>");
        else {
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
                        "                        <a href=\"${addtoCart}\">\n" +
                        "                            Thêm vào giỏ hàng\n" +
                        "                        </a>\n" +
                        "                    </button>\n" +
                        "                </div>\n" +
                        "                <span class=\"close\" onclick=\"closePopup('" + food.getIdFood() + "')\">&times;</span>\n" +
                        "            </div>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}