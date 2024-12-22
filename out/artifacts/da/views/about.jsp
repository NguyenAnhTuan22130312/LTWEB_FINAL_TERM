<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Food T^3</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinCssModule.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_header_footer.css" />
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
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
                          src="<c:url value='/Images/LOGO_V2.png' />"
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
                    href="views/UserInformation.jsp"
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
                <a href="#" class="count">8</a>
              </div>
            </div>
          </div>
          <div class="bottom">
            <div class="menu">
              <ul class="menu-list">
                <li class="menu-item">
                  <a href="allmenu?option=tatca" class="tabbar">
                    <i class="fa-solid fa-bars"></i>Thực đơn</a
                  >
                  <ul class="submenu">
                    <li>
                      <a href="allmenu?option=tatca"
                        ><i class="fa-solid fa-bowl-rice"></i>Tất cả</a
                      >
                    </li>
                    <li>
                      <a href="allmenu?option=1"
                        ><i class="fa-solid fa-bowl-rice"></i>Món cơm</a
                      >
                    </li>
                    <li>
                      <a href="allmenu?option=2"
                        ><i class="fa-solid fa-bowl-food"></i>Món bún</a
                      >
                    </li>
                    <li>
                      <a href="allmenu?option=3"
                        ><i class="fa-solid fa-bowl-food"></i>Món phở</a
                      >
                    </li>
                    <li>
                      <a href="allmenu?option=4"
                        ><i class="fa-solid fa-glass-water"></i>Nước</a
                      >
                    </li>
                  </ul>
                </li>
                <li class="menu-item">
                  <a href="home">Trang chủ</a>
                </li>
                
                <li class="menu-item">
                  <a href="views/about.jsp">Giới thiệu</a>
                </li>
                <li class="menu-item">
                  <a href="contact-controll">Liên hệ</a>
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

    <!-- Xử lý content\  -->
    <div class="container">
      <div class="content_dis">
        <div class="left_content">
          <p>
            Chào mừng bạn đến với Food T^3 nơi mang đến những bữa trưa thơm
            ngon, đầy đủ dinh dưỡng và tràn đầy năng lượng cho một ngày làm việc
            hiệu quả!
          </p>
        </div>
        <div class="right_content">
          <video autoplay muted loop>
            <source
                    src="<c:url value='/Videos/[appsgolem.com][00-00-00][00-00-16]_Miami_s_Best_New_Chef_is_Mak.mp4' />"
                    type="video/mp4"
            />
            Trình duyệt của bạn không hỗ trợ video.
          </video>
        </div>

      </div>

      <div class="allInfo">
        <div class="text2">Quản Lý Cửa Hàng</div>
        <div class="card-container">
          <div class="card-info">
            <img src="<c:url value="/Images/team/trung_han.jpg" />" alt="Hình ảnh cá nhân" />
            <div class="info">
              <h3>Hán Hữu Trung</h3>
              <p>MSSV: 22130302</p>
              <p>Lớp: DH22DTC</p>
            </div>
          </div>

          <div class="card-info">
            <img
              src="<c:url value="/Images/team/tuan_22130311.jpg"/>"
              alt="Hình ảnh cá nhân"
            />
            <div class="info">
              <h3>Nguyễn Anh Tuấn</h3>
              <p>MSSV: 22130311</p>
              <p>Lớp: DH22DTC</p>
            </div>
          </div>

          <div class="card-info">
            <img
              src="<c:url value="/Images/team/tuan_22130312.jpg"/> "
              alt="Hình ảnh cá nhân"
            />
            <div class="info">
              <h3>Nguyễn Anh Tuấn</h3>
              <p>MSSV: 22130312</p>
              <p>Lớp: DH22DTA</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
    <div id="container-monban">
      <div class="header-mon">

          <div class="tag">Hãy đến với chúng tôi vì chúng tôi có</div>
          
      </div>
      <div class="content_section_bottom">
          <div class="card_bottom">
              <img src="<c:url value="/Images/home/pic1.jpg"/> " />
              <div class="text">Nguyên liệu tươi mới</div>
          </div>
          <div class="card_bottom">
              <img src="<c:url value="/Images/home/pic2.jpg"/>" />
              <div class="text">Món ăn ngon miệng</div>
          </div>
          <div class="card_bottom">
              <img src="<c:url value="/Images/home/pic3.jpg"/>" />
              <div class="text">Đóng gói tiện lợi</div>
          </div>
          <div class="card_bottom">
              <img src="<c:url value="/Images/home/pic4.jpg"/> "/>
              <div class="text">Giao hàng tận nơi</div>
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
    <script src="${pageContext.request.contextPath}/js/home.js"></script>
    <script src="${pageContext.request.contextPath}/js/module_popup_home.js"></script>

  </body>
</html>
