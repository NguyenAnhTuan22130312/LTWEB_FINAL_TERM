package hcmuaf.nlu.edu.vn.testproject.models;

import java.util.ArrayList;
import java.util.List;

public class OrderInvoice {
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
    private List<InvoiceDetail> invoiceDetails;

    public OrderInvoice() {
    }

    public OrderInvoice(int idInvoice, int idAcc, String recipientName, String phoneNumber, String deliveryAddress, String note, String orderDate, int totalAmount, int idCode, int paymentMethod, int isPaid, List<InvoiceDetail> invoiceDetails) {
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
        this.invoiceDetails = invoiceDetails;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
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

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getIdCode() {
        return idCode;
    }

    public void setIdCode(int idCode) {
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

    public List<InvoiceDetail> getInvoiceDetails() {
        return invoiceDetails;
    }

    public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
        this.invoiceDetails = invoiceDetails;
    }

    @Override
    public String toString() {
        return "OrderInvoice{" +
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
                ", invoiceDetails=" + invoiceDetails +
                '}';
    }
}
