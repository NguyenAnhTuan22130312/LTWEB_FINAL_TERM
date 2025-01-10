package hcmuaf.nlu.edu.vn.testproject.daos;
import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Account;
import hcmuaf.nlu.edu.vn.testproject.models.Invoice;
import hcmuaf.nlu.edu.vn.testproject.models.InvoiceDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class InvoiceDAO {
    public void addInvoice(Invoice invoice) {
        String query = "INSERT INTO invoice (idAcc, recipientName, phoneNumber, deliveryAddress, note, orderDate, totalAmount, idCode, paymentMethod, isPaid) VALUES (?, ?, ?, ?, ?, ?, ?, NULL, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DbContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, invoice.getIdAcc());
            ps.setString(2, invoice.getRecipientName());
            ps.setString(3, invoice.getPhoneNumber());
            ps.setString(4, invoice.getDeliveryAddress());
            ps.setString(5, invoice.getNote());
            ps.setString(6, invoice.getOrderDate());
            ps.setInt(7, invoice.getTotalAmount());
            ps.setInt(8, invoice.getPaymentMethod());
            ps.setInt(9, invoice.getIsPaid());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addInvoiceDetail(InvoiceDetail detail) {
        String query = "INSERT INTO invoicedetail (idInvoice, idFood, quantity, totalAmount) VALUES (?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DbContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, detail.getIdInvoice());
            ps.setInt(2, detail.getIdFood());
            ps.setInt(3, detail.getQuantity());
            ps.setInt(4, detail.getTotalAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        // Tạo đối tượng Invoice
        Invoice invoice = new Invoice();
        invoice.setIdAcc(1);
        invoice.setRecipientName("Nguyen Van A");
        invoice.setPhoneNumber("0123456789");
        invoice.setDeliveryAddress("123 Đường ABC, Quận 1, TP.HCM");
        invoice.setNote("Giao hàng vào buổi sáng");
        invoice.setOrderDate("2025/1/1");
        invoice.setTotalAmount(500000);
        invoice.setPaymentMethod(1);  // 1 cho thẻ tín dụng, 0 cho tiền mặt
        invoice.setIsPaid(1); // 1 cho đã thanh toán, 0 cho chưa thanh toán

        // Tạo đối tượng InvoiceDetail
        InvoiceDetail detail = new InvoiceDetail();
        detail.setIdInvoice(2);  // Giả sử idInvoice là 1
        detail.setIdFood(12);  // Giả sử idFood là 101
        detail.setQuantity(2);
        detail.setTotalAmount(200000);

        // Khởi tạo InvoiceDAO
        InvoiceDAO dao = new InvoiceDAO();


        // Thêm InvoiceDetail vào cơ sở dữ liệu
        dao.addInvoiceDetail(detail);

        System.out.println("Đã thêm Invoice và InvoiceDetail thành công!");
    }
}
