package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.InvoiceOrderDao;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;

import java.util.ArrayList;
import java.util.List;

public class InvoiceOrderServices {
    private InvoiceOrderDao invoiceOrderDao ;

    public InvoiceOrderServices() {
        this.invoiceOrderDao = new InvoiceOrderDao();
    }
    public List<OrderInvoice> getOption(String option) {
        List<OrderInvoice> ois = new ArrayList<>();
        switch (option) {
            case  "0":
                ois = invoiceOrderDao.getAll();
                break;
            case "1":
                ois = invoiceOrderDao.getInvoiceShipping();
                break;
            case "2":
                ois = invoiceOrderDao.getInvoiceDelivered();
                break;
            case "3":
                ois = invoiceOrderDao.getInvoiceCancelled();
                break;

        }
        return ois;
    }

    public static void main(String[] args) {
        InvoiceOrderServices is = new InvoiceOrderServices();
        List<OrderInvoice> ois = is.getOption("0");

        for(OrderInvoice oi : ois){
            System.out.println(oi);
            System.out.println(oi.getOrderInvoiceDetail().toString());
        }
    }
}
