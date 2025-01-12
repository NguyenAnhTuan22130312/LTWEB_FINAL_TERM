package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.context.DbContext;
import hcmuaf.nlu.edu.vn.testproject.models.Food;
import hcmuaf.nlu.edu.vn.testproject.models.Invoice;
import hcmuaf.nlu.edu.vn.testproject.models.OrderInvoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InvoiceOrderDao {

    private List<OrderInvoice> data;

    public InvoiceOrderDao() {
        this.data = new ArrayList<>();
        getAllInvoice();
    }


    // Hàm lấy tất cả các món ăn từ cơ sở dữ liệu
    public void getAllInvoice() {

        String query = "SELECT * FROM invoice inv join orderstatus os ON inv.idInvoice = os.idInvoice;";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = new DbContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                data.add(new OrderInvoice(
                                rs.getInt("idInvoice"),
                                rs.getInt("idAcc"),
                                rs.getString("recipientName"),
                                rs.getString("phoneNumber"),
                                rs.getString("deliveryAddress"),
                                rs.getString("note"),
                                rs.getString("orderDate"),
                                rs.getInt("totalAmount"),
                                rs.getInt("idCode"),
                                rs.getInt("paymentMethod"),
                                rs.getInt("isPaid"),
                                rs.getInt("orderSt"),
                                InvoiceOrderDetailDao.getInvoiceOrderDetails(rs.getInt("idInvoice"))

                        ));
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Đảm bảo rằng kết nối, câu lệnh và result set được đóng đúng cách
            closeResources(rs, ps, con);
        }
    }

    // Phương thức đóng các tài nguyên
    private void closeResources(ResultSet rs, PreparedStatement ps, Connection con) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
        }
    }

    public List<OrderInvoice> getAll() {
        return data;
    }



    public List <OrderInvoice> getInvoiceShipping(){
        List<OrderInvoice> ois = new ArrayList<>();
        for (OrderInvoice oi : data) {
            if (oi.getOrderSt()==1) {
               ois.add(oi);
            }
        }
        return ois;
    }
    public List <OrderInvoice> getInvoiceDelivered(){
        List<OrderInvoice> ois = new ArrayList<>();
        for (OrderInvoice oi : data) {
            if (oi.getOrderSt()==2) {
                ois.add(oi);
            }
        }
        return ois;
    }
    public List <OrderInvoice> getInvoiceCancelled(){
        List<OrderInvoice> ois = new ArrayList<>();
        for (OrderInvoice oi : data) {
            if (oi.getOrderSt()==3) {
                ois.add(oi);
            }
        }
        return ois;
    }
    public static void main(String[] args) {
        InvoiceOrderDao dao = new InvoiceOrderDao();
        List<OrderInvoice> ois = dao.getAll();
        for(OrderInvoice oi : ois){
            System.out.println(oi.getOrderInvoiceDetail().toString());
        }
    }

}
