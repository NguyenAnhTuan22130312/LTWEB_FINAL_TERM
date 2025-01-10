package hcmuaf.nlu.edu.vn.testproject.models;

public class Invoice {
    private int idInvoice;
    private int idAcc;
    private String recipientName;
    private String phoneNumber;
    private String deliveryAddress;
    private String note;
    private String orderDate;
    private int totalAmount;
    private int idCode;
    private int paymentMethod;
    private int isPaid;

    public Invoice() {
    }

    public Invoice(int idInvoice, int idAcc, String recipientName, String phoneNumber, String deliveryAddress, String note, String orderDate, int totalAmount, int idCode, int paymentMethod, int isPaid) {
        this.idInvoice = idInvoice;
        this.idAcc = idAcc;
        this.recipientName = recipientName;
        this.phoneNumber = phoneNumber;
        this.deliveryAddress = deliveryAddress;
        this.note = note;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.idCode = idCode;
        this.paymentMethod = paymentMethod;
        this.isPaid = isPaid;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public Integer getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(Integer idAcc) {
        this.idAcc = idAcc;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Integer totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getIdCode() {
        return idCode;
    }

    public void setIdCode(Integer idCode) {
        this.idCode = idCode;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(int isPaid) {
        this.isPaid = isPaid;
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "idInvoice=" + idInvoice +
                ", idAcc=" + idAcc +
                ", recipientName='" + recipientName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", deliveryAddress='" + deliveryAddress + '\'' +
                ", note='" + note + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", totalAmount=" + totalAmount +
                ", idCode=" + idCode +
                ", paymentMethod=" + paymentMethod +
                ", isPaid=" + isPaid +
                '}';
    }
}
