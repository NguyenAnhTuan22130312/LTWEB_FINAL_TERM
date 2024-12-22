package hcmuaf.nlu.edu.vn.testproject.models;

import java.sql.Timestamp;

public class Food {
    private int idFood;
    private String foodName;
    private int price; // Giá có thể null
    private int discountPrice;
    private int quantity;
    private String img;
    private String description;
    private int idCategory;
    private int deleted;
    private int sold;
    private int views;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Food(){

    }

    public Food(int idFood, String foodName, int price, int discountPrice, int quantity, String img, String description, int idCategory, int deleted, int sold, int views, Timestamp createdAt, Timestamp updatedAt) {
        this.idFood = idFood;
        this.foodName = foodName;
        this.price = price;
        this.discountPrice = discountPrice;
        this.quantity = quantity;
        this.img = img;
        this.description = description;
        this.idCategory = idCategory;
        this.deleted = deleted;
        this.sold = sold;
        this.views = views;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getIdFood() {
        return idFood;
    }

    public String getFoodName() {
        return foodName;
    }

    public int getPrice() {
        return price;
    }

    public int getDiscountPrice() {
        return discountPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImg() {
        return img;
    }

    public String getDescription() {
        return description;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public int getDeleted() {return deleted;}

    public int getSold() {
        return sold;
    }

    public int getViews() {
        return views;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDiscountPrice(int discountPrice) {
        this.discountPrice = discountPrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public void setDeleted(int deleted) {this.deleted = deleted;}

    public void setSold(int sold) {
        this.sold = sold;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Food{" +
                "idFood=" + idFood +
                ", foodName='" + foodName + '\'' +
                ", price=" + price +
                ", discountPrice=" + discountPrice +
                ", quantity=" + quantity +
                ", img='" + img + '\'' +
                ", description='" + description + '\'' +
                ", idCategory=" + idCategory +
                ", deleted=" + deleted +
                ", sold=" + sold +
                ", views=" + views +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
