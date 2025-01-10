package hcmuaf.nlu.edu.vn.testproject.models;

public class InvoiceDetail {
    private int idDetail;
    private int idInvoice;
    private int idFood;
    private int quantity;
    private int totalAmount;

    public InvoiceDetail() {
    }

    @Override
    public String toString() {
        return "InvoiceDetail{" +
                "idDetail=" + idDetail +
                ", idInvoice=" + idInvoice +
                ", idFood=" + idFood +
                ", quantity=" + quantity +
                ", totalAmount=" + totalAmount +
                '}';
    }

    public InvoiceDetail(int idDetail, int idInvoice, int idFood, int quantity, int totalAmount) {
        this.idDetail = idDetail;
        this.idInvoice = idInvoice;
        this.idFood = idFood;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
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
}
