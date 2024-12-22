package hcmuaf.nlu.edu.vn.testproject.models;

public class CartItem {
    private Food food;
    private int quantity;

    public CartItem(Food food, int quantity) {
        this.food = food;
        this.quantity = quantity;
    }

    public CartItem() {
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean add(int quantity) {
        this.quantity += quantity;
        return true;
    }

}