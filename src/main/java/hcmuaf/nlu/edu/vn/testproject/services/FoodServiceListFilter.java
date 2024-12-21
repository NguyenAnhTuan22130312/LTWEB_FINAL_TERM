package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.dao.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Food;

import java.util.List;

public class FoodServiceListFilter {
    static FoodDAO foodDAO = new FoodDAO();
    public List<Food> getTop4Views(){
        return foodDAO.getTop4View();
    }
    public List<Food> getTop4Sold(){
        return foodDAO.getTop4Sold();
    }
    public List<Food> getTop4Propose(){
        return foodDAO.getTop4Propose();
    }

}
