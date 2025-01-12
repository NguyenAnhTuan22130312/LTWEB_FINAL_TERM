package hcmuaf.nlu.edu.vn.testproject.models;

public class OrderInvoiceDetail {
    private int idDetail;
    private int idInvoice;
    private int idFood;
    private String foodName;
    private int quantity;
    private int totalAmount;
    private String img;

    public OrderInvoiceDetail() {
    }


    public OrderInvoiceDetail(int idDetail, int idInvoice, int idFood,String foodName, int quantity, int totalAmount, String img) {
        this.idDetail = idDetail;
        this.idInvoice = idInvoice;
        this.idFood = idFood;
        this.foodName = foodName;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.img = img;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getIdDetail() {
        return idDetail;
    }

    public void setIdDetail(int idDetail) {
        this.idDetail = idDetail;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getIdFood() {
        return idFood;
    }

    public void setIdFood(int idFood) {
        this.idFood = idFood;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "OrderInvoiceDetail{" +
                "idDetail=" + idDetail +
                ", idInvoice=" + idInvoice +
                ", idFood=" + idFood +
                ", foodName='" + foodName + '\'' +
                ", quantity=" + quantity +
                ", totalAmount=" + totalAmount +
                ", img='" + img + '\'' +
                '}';
    }
}
