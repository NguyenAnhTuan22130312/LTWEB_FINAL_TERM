<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đơn hàng</title>
    <link href="../Images/LOGO_V2.png" rel="icon" type="image/x-icon" />
    <link rel="stylesheet" href="css/order.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
  </head>
  <body>
    <div class="container">
      <div class="sidebar">
        <img alt="admin" src="../Images/LOGO_V2.png" />
        <h2>T^3 Restaurant</h2>
        <ul>
          <li>
            <a class="active" href="../html/admin.html">
              <i class="fas fa-home"> </i>
              Trang tổng quan
            </a>
          </li>
          <li>
            <a href="../html/food_service.html">
              <i class="fas fa-utensils"> </i>
              Sản phẩm
            </a>
          </li>
            <li>
                <a href="../html/banner.html">
                    <i class="fas fa-image">
                    </i>
                    Quản lý Banner
                </a>
            </li>
          <li>
            <a href="../html/customer_sevice.html">
              <i class="fas fa-users"> </i>
              Khách hàng
            </a>
          </li>
          <li>
            <a href="../html/order.html">
              <i class="fas fa-shopping-cart"> </i>
              Đơn hàng
            </a>
          </li>
          <li>
            <a href="../html/statistical.html">
              <i class="fas fa-chart-bar"> </i>
              Thống kê
            </a>
          </li>

          <li>
            <a href="../html/discount.html">
              <i class="fas fa-chart-bar"> </i>
              Quản lý mã giảm giá
            </a>
          </li>

          <li>
            <a id="logout" href="../html/newhome.html">
              <i class="fas fa-sign-out-alt"> </i>
              Đăng xuất
            </a>
            
          </li>
        </ul>
      </div>
      <div class="content">
        <div class="header">
          <select>
            <option>Tất cả</option>
          </select>
          <input placeholder="Tìm kiếm mã đơn hoặc khách hàng..." type="text" />
          <input
            onblur="(this.type='text')"
            onfocus="(this.type='date')"
            placeholder="Từ"
            type="text"
          />
          <input
            onblur="(this.type='text')"
            onfocus="(this.type='date')"
            placeholder="Đến"
            type="text"
          />
          <div class="icons">
            <i class="fas fa-sort-amount-down"> </i>
            <i class="fas fa-sort-amount-up"> </i>
            <i class="fas fa-sync-alt"> </i>
          </div>
        </div>

        <table>
          <thead>
            <tr>
              <th>MÃ ĐƠN</th>
              <th>KHÁCH HÀNG</th>
              <th>NGÀY ĐẶT</th>
              <th>TỔNG TIỀN</th>
              <th>TRẠNG THÁI</th>
            </tr>
          </thead>
          <tbody>

            <tr>
            <td>DH1</td>
            <td>TuanAnh</td>
            <td>17/11/2024</td>
            <td>210.000đ</td>
            <td>
              <button class="details-button">Đang vận chuyển</button>
            </td>
            </tr>

            <tr>
              <td>DH2</td>
              <td>Hữu Trung</td>
              <td>20/11/2024</td>
              <td>30.000đ</td>
              <td>
                <button class="details-button">Đã hoàn thành</button>
              </td>
            </tr>

              <tr>
                <td>DH3</td>
                <td>Anh Tuấn</td>
                <td>21/11/2024</td>
                <td>90.000đ</td>
                <td>
                  <button class="details-button">Đã hoàn thành</button>
                </td>
              </tr>


          </tbody>
        </table>
      </div>
    </div>
    <script src="js/module_dangnhap.js"></script>
  </body>
</html>
