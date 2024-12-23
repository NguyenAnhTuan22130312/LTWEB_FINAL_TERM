<%@ page import="hcmuaf.nlu.edu.vn.testproject.models.Food" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  List<Food> cart = (List<Food>) session.getAttribute("cart");
  if (cart == null) {
    cart = new ArrayList<>();
  }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giỏ hàng</title>
    <link href="${pageContext.request.contextPath}/Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinCssModule.css" />
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
  </head>

  <body>
  <div id="header">
    <div class="containerheaderAll">
      <div class="containers">
        <div class="containerss">
          <div class="left">
            <div class="logo">
              <a href="home">
                <img
                        src="${pageContext.request.contextPath}/Images/LOGO_V2.png"
                        alt="Food store của Trung, Atuan, Atuan"
                />
              </a>
            </div>
          </div>
          <div class="right">
            <c:if test="${sessionScope.currentUser == null}">
              <a href="login" class="nav-item" id="login-link">
                <i class="fa-solid fa-user"></i> Đăng Nhập
              </a>
            </c:if>

            <c:if test="${sessionScope.currentUser != null}">
              <div class="user-menu" id="user-menu" >
                <i class="fa-solid fa-user"></i>
                <a href="#" class=" user-name" id="user-name">
                    ${sessionScope.currentUser.userName}
                </a>
                <div class="submenu" id="submenu">
                  <c:if test="${sessionScope.currentUser.idRole == 1}">
                    <a href="views/admin.jsp" id="admin-link">Quản trị</a>
                  </c:if>
                  <c:if test="${sessionScope.currentUser.idRole == 2}">
                    <a href="views/UserInformation.jsp" id="user-link">Thông tin</a>
                  </c:if>
                  <a href="logout" id="logout">Đăng xuất</a>
                </div>
              </div>
            </c:if>
            <div class="nav_item_shop">
              <a href="views/PurchaseOrder.jsp" class="nav-item">
                <i class="fa-solid fa-truck-fast"></i> Đơn hàng
              </a>
              <a href="#" class="count">2</a>
            </div>
            <div class="nav_item_shop">
              <a href="shoppingcart" class="nav-item">
                <i class="fa-solid fa-basket-shopping"></i> Giỏ hàng
              </a>
              <a href="shoppingcart" class="count">8</a>
            </div>
          </div>
        </div>
        <div class="bottom">
          <div class="menu">
            <ul class="menu-list">
              <li class="menu-item">
                <a href="allmenu" class="tabbar">
                  <i class="fa-solid fa-bars"></i>Thực đơn</a
                >
                <ul class="submenu">
                  <li>
                    <a href="allmenu"
                    ><i class="fa-solid fa-bowl-rice"></i>Tất cả</a
                    >
                  </li>
                  <c:forEach var="category" items="${listC}">
                    <li>
                      <a href="allmenu?idc=${category.idCategory}"
                      ><i class="fa-solid fa-bowl-rice"></i>${category.nameCategory}</a
                      >
                    </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="menu-item">
                <a href="home">Trang chủ</a>
              </li>

              <li class="menu-item">
                <a href="views/about.jsp">Giới thiệu</a>
              </li>
              <li class="menu-item">
                <a href="views/contact.jsp">Liên hệ</a>
              </li>
            </ul>
          </div>


          <div class="search">
            <form action="search" method="post">
              <input name="text" type="text" placeholder="Tìm kiếm món ăn"/>
              <button type="submit">
                <i class="fa-solid fa-search"></i>
              </button>
            </form>
          </div>

        </div>
      </div>
    </div>
  </div>

    <div id="content_section">
      <div class="cart-container">
        <div class="cart-left">
          <table class="cart-table">
            <thead>
              <tr>
                <th></th>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Thành tiền</th>
                <th>
                  <i
                    class="fa-regular fa-trash-can"
                    onclick="removeSelectedProducts()"
                  ></i>
                </th>
              </tr>
            </thead>
            <tbody id="cart-items-container" class="cart-body">
            <%
              int total = 0;
              for (Food item : cart) {
                int quantity = 1;  // Mặc định số lượng là 1 (có thể thay đổi sau)
                int totalPrice = item.getPrice() * quantity;  // Tính giá trị của món ăn
                total += totalPrice;  // Cập nhật tổng số tiền
            %>
            <tr>
              <td>
                <button class="delete-btn">
                  <i class="fa-regular fa-trash-can"></i>
                </button>
              </td>
              <td><%= item.getFoodName() %></td>
              <td>
                <img src="<%= item.getImg() %>" alt="<%= item.getFoodName() %>" class="product-img" />
              </td>
              <td>
                <input type="number" value="<%= quantity %>" min="1" class="quantity-input" />
              </td>
              <td><%= item.getPrice() %>₫</td>
              <td><%= totalPrice %>₫</td>
              <td></td>
            </tr>
            <% } %>
            </tbody>

          </table>
          <div class="cart-buttons">
            <button
              class="continue-btn">
              <a href="home">← Tiếp tục xem sản phẩm</a>
            </button>
          </div>
        </div>

        <div class="cart-right">
          <h2>Tổng Sản Phẩm</h2>
          <div class="cart-summary">
            <div class="summary-item">
              <span>Tạm tính:</span>
              <span id="subtotal">190.000&nbsp;đ</span>
            </div>
          </div>
          <div class="summary-item total">
            <span>Tổng cộng:</span>
            <span id="total">190.000&nbsp;đ</span>
          </div>
          <button
            class="checkout-btn"
            onclick="window.location.href='views/check-out.jsp'"
          >
            Tiến hành thanh toán
          </button>

          <div class="voucher">
            <label for="voucher">Phiếu ưu đãi</label>
            <input type="text" id="voucher" placeholder="Mã ưu đãi" />
            <button class="apply-btn" onclick="applyVoucher()">Áp dụng</button>
          </div>
        </div>
      </div>
    </div>

    <div id="footer">
      <div class="footer-container">
        <div class="footer-info">
          <div class="left">
            <p>
              <strong>Địa chỉ:</strong> Khu phố 6, Phường Linh Trung, TP. Thủ
              Đức,
            </p>
            <p style="text-indent: 60px">Tp. Hồ Chí Minh.</p>
            <p><strong>Giờ mở cửa:</strong> 9h00 - 19h00, hàng ngày</p>
          </div>
          <div class="right">
            <p><strong>Hotline:</strong> 033 *** 1234</p>
            <p><strong>Phản ánh chất lượng:</strong> 033***1234</p>
            <p><strong>Email:</strong> pdaotao@hcmuaf.edu.vn</p>
            <div class="social-icons">
              <a href="#" target="_blank"
                ><i class="fa-brands fa-facebook"></i
              ></a>
              <a href="#" target="_blank"
                ><i class="fa-brands fa-instagram"></i
              ></a>
            </div>
          </div>
        </div>
        <div class="footer-social">
          <div class="1">© 2024 Food T^3</div>
          <div class="mid">
            <a href="#">Chính sách hoạt động</a> |
            <a href="#">Chính sách bảo mật thông tin</a>
          </div>
        </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
  </body>
</html>
