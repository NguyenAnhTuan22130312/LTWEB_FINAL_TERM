package hcmuaf.nlu.edu.vn.testproject.controllers;

import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.services.FoodDAO;

import java.util.ArrayList;
import java.util.List;

public class test {
    public static void main(String[] args) {
        FoodDAO foodDao = new FoodDAO();
        List<Food> foodList = foodDao.getAllFood();
        for (Food food : foodList) {
            System.out.println(food);
        }
        System.out.println("Food list size: " + foodList.size());
    }
}
