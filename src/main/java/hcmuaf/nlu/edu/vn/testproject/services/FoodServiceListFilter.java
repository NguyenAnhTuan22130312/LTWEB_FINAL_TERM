package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.FoodDAO;
import hcmuaf.nlu.edu.vn.testproject.daos.ReviewDAO;
import hcmuaf.nlu.edu.vn.testproject.models.Food;

import java.util.ArrayList;
import java.util.List;

public class FoodServiceListFilter {
    static FoodDAO foodDAO = new FoodDAO();
    static ReviewDAO reviewDAO = new ReviewDAO();

    public List<Food> getTop4Views() {
        return foodDAO.getTop4View();
    }

    public List<Food> getTop4Sold() {
        return foodDAO.getTop4Sold();
    }

    public List<Food> getTop4Propose() {
        return foodDAO.getTop4Propose();
    }

    public List<Food> getTop4Rate() {
        List<Food> lsIdFood = new ArrayList<>();
        for (int i : reviewDAO.getTop4FoodRate()) {
            lsIdFood.add(foodDAO.getById(i));
        }
        return lsIdFood;
    }

    public List<Food> getTopRate() {
        List<Food> lsIdFood = new ArrayList<>();
        for (int i : reviewDAO.getTopFoodRate()) {
            lsIdFood.add(foodDAO.getById(i));
        }
        return lsIdFood;
    }

    public List<Food> getOption(String option) {
        List<Food> lsFood = new ArrayList<>();
        switch (option) {
            case "tatca":
                lsFood = foodDAO.getAll();
                break;
            case "danhgiacao":
                for (int i : reviewDAO.getTopFoodRate()) {
                    lsFood.add(foodDAO.getById(i));
                }
                break;
            case "dexuat":
                lsFood = foodDAO.getTopPropose();
                break;
            case "quantam":
                lsFood = foodDAO.getTopView();
                break;
            case "banchay":
                lsFood = foodDAO.getTopSold();
                break;

            default:
                lsFood = foodDAO.getComBunPhoNuoc(option);
        }
        return lsFood;
    }

}
