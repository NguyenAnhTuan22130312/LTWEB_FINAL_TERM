package hcmuaf.nlu.edu.vn.testproject.models;

public class Item {
    private int idItem;
    private Food food;
    private int quantity;
    private int price;

    public Item() {
    }

    public Item(int idItem, Food food, int quantity, int price) {
        this.idItem = idItem;
        this.food = food;
        this.quantity = quantity;
        this.price = price;
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
