package hcmuaf.nlu.edu.vn.testproject.services;

import hcmuaf.nlu.edu.vn.testproject.daos.AdminInvoiceOrderDao;
import hcmuaf.nlu.edu.vn.testproject.daos.InvoiceOrderDao;
import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AdminInvoiceService {

    public AdminInvoiceOrderDao dao;

    public AdminInvoiceService() {
        this.dao = new AdminInvoiceOrderDao();
    }

    public List<OrderInvoice> getOption(String option) {
        List<OrderInvoice> ois = new ArrayList<>();
        switch (option) {
            case "all":
                ois = dao.getAll();
                break;
            case "shipping":
                ois = dao.getInvoiceShipping();
                break;
            case "delivered":
                ois = dao.getInvoiceDelivered();
                break;
            case "canceled":
                ois = dao.getInvoiceCancelled();
                break;
            case "yearmonth":
                ois = dao.getInvoicesByCurrentMonthAndYear();
                break;
            case "year":
                ois = dao.getInvoicesByCurrentYear();
                break;
            default:
                ois =  dao.getInvoiceOrders(option);
                break;
        }
        Collections.reverse(ois);
        return ois;
    }
}