<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Menu các món cơm</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allmenu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinCssModule.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_submenu_catelory.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
  </head>


  <body>
    <div id="header">
      <div class="containerheaderAll">
        <div class="containers">
          <div class="containerss">
            <div class="left">
              <div class="logo">
                <a href="views/newhome.jsp">
                  <img
                    src="Images/LOGO_V2.png"
                    alt="Food store của Trung, Atuan, Atuan"
                  />
                </a>
              </div>
            </div>
            <div class="right">
              <a href="views/signin.jsp" class="nav-item" id="login-link">
                <i class="fa-solid fa-user"></i> Đăng Nhập
              </a>
              <div class="user-menu" id="user-menu" style="display: none">
                <i class="fa-solid fa-user"></i>
                <a href="#" class="user-name" id="user-name">
                  Tên người dùng
                </a>
                <div class="submenu" id="submenu">
                  <a
                    href="views/admin.jsp"
                    id="admin-link"
                    style="display: none"
                    >Quản trị</a
                  >
                  <a
                    href="UserInformation.jsp"
                    id="user-link"
                    style="display: none"
                    >Thông tin</a
                  >
                  <a href="#" id="logout">Đăng xuất</a>
                </div>
              </div>
              <div class="nav_item_shop">
                <a href="views/PurchaseOrder.jsp" class="nav-item">
                  <i class="fa-solid fa-truck-fast"></i> Đơn hàng
                </a>
                <a href="#" class="count">2</a>
              </div>
              <div class="nav_item_shop">
                <a href="views/cart.jsp" class="nav-item">
                  <i class="fa-solid fa-basket-shopping"></i> Giỏ hàng
                </a>
                <a href="#" class="count"> 8</a>
              </div>
            </div>
          </div>
          <div class="bottom">
            <div class="menu">
              <ul class="menu-list">
                <li class="menu-item">
                  <a href="#" class="tabbar">
                    <i class="fa-solid fa-bars"></i>Thực đơn</a
                  >
                  <ul class="submenu">
                    <li>
                      <a href="views/allMenu.jsp"
                        ><i class="fa-solid fa-bowl-rice"></i>Tất cả</a
                      >
                    </li>
                    <li>
                      <a href="views/menu_com.jsp"
                        ><i class="fa-solid fa-bowl-rice"></i>Món cơm</a
                      >
                    </li>
                    <li>
                      <a href="views/menu_bun.jsp"
                        ><i class="fa-solid fa-bowl-food"></i>Món bún</a
                      >
                    </li>
                    <li>
                      <a href="views/menu_pho.jsp"
                        ><i class="fa-solid fa-bowl-food"></i>Món phở</a
                      >
                    </li>
                    <li>
                      <a href="views/menu_nuoc.jsp"
                        ><i class="fa-solid fa-glass-water"></i>Nước</a
                      >
                    </li>
                  </ul>
                </li>
                <li class="menu-item">
                  <a href="views/newhome.jsp">Trang chủ</a>
                </li>
                
                <li class="menu-item">
                  <a href="views/about.jsp">Giới thiệu</a>
                </li>
                <li class="menu-item">
                  <a href="views/contact.jsp">Liên hệ</a>
                </li>
              </ul>
            </div>

            <form action="search" method="post">
              <div class="search">
                <input name="text" type="text" placeholder="Tìm kiếm món ăn" />
                <button type="submit">
                  <i class="fa-solid fa-search"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div id="container">
      <div class="intro">
        <h2>Khám Phá Thực Đơn Của Chúng Tôi</h2>
        <div class="category-container">
          <a href="views/allMenu.jsp"
            ><div class="category-item">Tất cả</div></a
          >
          <a href="views/allMenu.jsp"
            ><div class="category-item">Món được ưa thích</div></a
          >
          <a href="views/allMenu.jsp"
            ><div class="category-item">Món được đề xuất</div></a
          >
          <a href="views/allMenu.jsp"
            ><div class="category-item">Món được quan tâm nhiều</div></a
          >
          <a href="views/allMenu.jsp"
            ><div class="category-item">Món bán chạy</div></a
          >
          <a href="views/menu_com.jsp"
            ><div class="category-item">Món cơm</div></a
          >
          <a href="views/menu_bun.jsp"
            ><div class="category-item">Món bún</div></a
          >
          <a href="views/menu_pho.jsp"
            ><div class="category-item">Món phở</div></a
          >
          <a href="views/menu_nuoc.jsp"
            ><div class="category-item">Nước</div></a
          >
        </div>
      </div>



      <div id="content_section" class="content_section">
        <c:forEach var="food" items="${list}">
          <div class="card" onclick="showPopup('${food.idFood}')">
            <img src="${food.img}" alt="${food.foodName}" />
            <div class="card_content">
              <h3>${food.foodName}</h3>
              <p>${food.price}đ</p>
              <a
                      class="btn"
                      href="cart.jsp?foodId=${food.idFood}"
                      onclick="event.stopPropagation()"
              >
                Thêm vào giỏ hàng
              </a>
            </div>
          </div>

          <!-- Popup chi tiết món ăn -->
          <div id="${food.idFood}" class="popup">
            <div class="popup-content">
              <img src="${food.img}" alt="${food.foodName}" />
              <h3>${food.foodName}</h3>
              <p>Giá: ${food.price}đ</p>
              <span>
                  ${food.description}
              </span>
              <button
                      class="button-cart"

                      onclick="window.location.href='cart.jsp?foodId=${food.idFood}'"
              >
                Thêm vào giỏ hàng
              </button>
            </div>
            <span class="close" onclick="closePopup('${food.idFood}')">&times;</span>
          </div>
        </c:forEach>
      </div>





      <!-- Phân trang -->
      <div class="pagination">
        <c:if test="${currentPage > 1}">
          <a href="food-pagination?page=${currentPage - 1}"><</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="i">
          <a href="food-pagination?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
          <a href="food-pagination?page=${currentPage + 1}">></a>
        </c:if>
      </div>

    </div>
    <!-- Xử lý footer -->
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
    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
  </body>
</html>
