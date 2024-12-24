package hcmuaf.nlu.edu.vn.testproject.controllers; import hcmuaf.nlu.edu.vn.testproject.daos.FoodCartDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.models.Item;
import hcmuaf.nlu.edu.vn.testproject.models.Order;
import hcmuaf.nlu.edu.vn.testproject.services.FoodService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartController", value = "/addtoCart")
public class AddToCartController extends HttpServlet {
    private FoodService foodService;

    @Override
    public void init() throws ServletException {
        foodService = new FoodCartDAO();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int id;
        if (request.getParameter("foodID") != null) {
            id = Integer.parseInt(request.getParameter("foodID"));
            Food food = foodService.getFoodByID(id);
            if (food != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Item> list = new ArrayList<Item>();
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setFood(food);
                    item.setPrice(food.getPrice());
                    list.add(item);
                    order.setItems(list);
                    session.setAttribute("order", order);
                }else{
                    Order order = (Order) session.getAttribute("order");
                    List<Item> list = order.getItems();
                    boolean found = false;
                    for (Item item : list) {
                        if (item.getFood().getIdFood() == food.getIdFood()) {
                            item.setQuantity(item.getQuantity() + quantity);
                            found = true;
                        }
                    }
                        if (found == false) {
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setFood(food);
                        item.setPrice(food.getPrice());
                        list.add(item);
                    }
                        session.setAttribute("order", order);
                }
            }
            response.sendRedirect("cart");
        } else {
            response.sendRedirect( "home");
        }
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}