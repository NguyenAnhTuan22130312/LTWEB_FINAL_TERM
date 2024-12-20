package hcmuaf.nlu.edu.vn.testproject.models;

public class Food {
    private int idFood;

    private String foodName;
    private int price; // Giá có thể null

    private String img;
    private String description;

    public Food(){

    }

    public Food(int idFood, String foodName, int price, String img, String description) {
        this.idFood = idFood;

        this.foodName = foodName;
        this.price = price;

        this.img = img;
        this.description = description;
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



    public String getImg() {
        return img;
    }

    public String getDescription() {
        return description;
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



    public void setImg(String img) {
        this.img = img;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Food{" +
                "idFood=" + idFood +

                ", foodName='" + foodName + '\'' +
                ", price=" + price +

                ", img='" + img + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
