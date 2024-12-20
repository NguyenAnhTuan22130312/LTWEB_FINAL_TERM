<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link rel="stylesheet" href="../css/cart.css" />
    <link rel="stylesheet" href="../css/signinCssModule.css" />
    <title>Giỏ hàng</title>
    <link href="../Images/LOGO_V2.png" rel="icon" type="image/x-icon" />
    <script src="../js/module_dangnhap.js" defer></script>
  </head>

  <body>
    <div id="header">
      <div class="containerheaderAll">
        <div class="containers">
          <div class="containerss">
            <div class="left">
              <div class="logo">
                <a href="../html/newhome.html">
                  <img
                    src="../Images/LOGO_V2.png"
                    alt="Food store của Trung, Atuan, Atuan"
                  />
                </a>
              </div>
            </div>
            <div class="right">
              <a href="../html/signin.html" class="nav-item" id="login-link">
                <i class="fa-solid fa-user"></i> Đăng Nhập
              </a>
              <div class="user-menu" id="user-menu" style="display: none">
                <i class="fa-solid fa-user"></i>
                <a href="#" class="user-name" id="user-name">
                  Tên người dùng
                </a>
                <div class="submenu" id="submenu">
                  <a
                    href="../html/admin.html"
                    id="admin-link"
                    style="display: none"
                    >Quản trị</a
                  >
                  <a
                    href="../html/UserInformation.html"
                    id="user-link"
                    style="display: none"
                    >Thông tin</a
                  >
                  <a href="#" id="logout">Đăng xuất</a>
                </div>
              </div>
              <div class="nav_item_shop">
                <a href="../html/PurchaseOrder.html" class="nav-item">
                    <i class="fa-solid fa-truck-fast"></i> Đơn hàng
                </a>
                <a href="#" class="count">2</a>
            </div>
              <div class="nav_item_shop">
                <a href="../html/cart.html" class="nav-item">
                  <i class="fa-solid fa-basket-shopping"></i> Giỏ hàng
                </a>
                <a href="#" class="count">8</a>
              </div>
            </div>
          </div>
          <div class="bottom">
            <div class="menu">
              <ul class="menu-list">
                <li class="menu-item">
                  <a href="../html/allMenu.html" class="tabbar">
                    <i class="fa-solid fa-bars"></i>Thực đơn</a
                  >
                  <ul class="submenu">
                    <li>
                      <a href="../html/allMenu.html"
                        ><i class="fa-solid fa-bowl-rice"></i>Tất cả</a
                      >
                    </li>
                    <li>
                      <a href="../html/menu_com.html"
                        ><i class="fa-solid fa-bowl-rice"></i>Món cơm</a
                      >
                    </li>
                    <li>
                      <a href="../html/menu_bun.html"
                        ><i class="fa-solid fa-bowl-food"></i>Món bún</a
                      >
                    </li>
                    <li>
                      <a href="../html/menu_pho.html"
                        ><i class="fa-solid fa-bowl-food"></i>Món phở</a
                      >
                    </li>
                    <li>
                      <a href="../html/menu_nuoc.html"
                        ><i class="fa-solid fa-glass-water"></i>Nước</a
                      >
                    </li>
                  </ul>
                </li>
                <li class="menu-item">
                  <a href="../html/newhome.html">Trang chủ</a>
                </li>
                
                <li class="menu-item">
                  <a href="../html/about.html">Giới thiệu</a>
                </li>
                <li class="menu-item">
                  <a href="../html/contact.html">Liên hệ</a>
                </li>
              </ul>
            </div>
            <div class="search">
              <input type="text" placeholder="Tìm kiếm món ăn" />
              <button type="submit">
                <i class="fa-solid fa-search"></i>
              </button>
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
              <tr>
                <td>
                  <button class="delete-btn">
                    <i class="fa-regular fa-trash-can"></i>
                  </button>
                </td>
                <td>Phở bò tái</td>
                <td>
                  <img
                    src="../Images/Food/Pho/Pho-bo-tai.png"
                    alt="pho"
                    class="product-img"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    value="1"
                    min="1"
                    class="quantity-input"
                  />
                </td>
                <td>35.000₫</td>
                <td>35.000₫</td>
                <td></td>
              </tr>

              <tr>
                <td>
                  <button class="delete-btn">
                    <i class="fa-regular fa-trash-can"></i>
                  </button>
                </td>
                <td>Bún thịt nướng</td>
                <td>
                  <img
                    src="../Images/Food/Bun/Bun-thit-nuong.png"
                    alt="bun"
                    class="product-img"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    value="3"
                    min="1"
                    class="quantity-input"
                  />
                </td>
                <td>25.000₫</td>
                <td>75.000₫</td>
                <td></td>
              </tr>

              <tr>
                <td>
                  <button class="delete-btn">
                    <i class="fa-regular fa-trash-can"></i>
                  </button>
                </td>
                <td>Trà chanh giã tay</td>
                <td>
                  <img
                    src="../Images/Food/nuoc/Tra_chanh_gia_tay.png"
                    alt="nuoc"
                    class="product-img"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    value="4"
                    min="1"
                    class="quantity-input"
                  />
                </td>
                <td>80.000₫</td>
                <td>80.000₫</td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <div class="cart-buttons">
            <button
              class="continue-btn"
              onclick="window.location.href='../html/newhome.jsp'"
            >
              ← Tiếp tục xem sản phẩm
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
            onclick="window.location.href='../html/check-out.html'"
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

    <script src="../js/cart.js"></script>
  </body>
</html>
