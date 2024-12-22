<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food T^3</title>
    <link href='Images/LOGO_V2.png' rel='icon' type='image/x-icon' />


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newhome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinCssModule.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="../js/module_dangnhap.js" defer></script>
</head>

<body>
    <div id="header">
        <div class="containerheaderAll">
            <div class="containers">
                <div class="containerss">
                    <div class="left">
                        <div class="logo">
                            <a href="views/newhome.jsp">
                                <img src="Images/LOGO_V2.png" alt="Food store của Trung, Atuan, Atuan">
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
                                <a href="views/admin.jsp" id="admin-link" style="display: none">Quản trị</a>
                                <a href="views/UserInformation.jsp" id="user-link" style="display: none">Thông
                                    tin</a>
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
                                <a href="views/allMenu.jsp" class="tabbar"> <i class="fa-solid fa-bars"></i>Thực đơn</a>
                                <ul class="submenu">
                                    <li><a href="views/allMenu.jsp"><i class="fa-solid fa-bowl-rice"></i>Tất cả</a>
                                    </li>
                                    <li><a href="views/menu_com.jsp"><i class="fa-solid fa-bowl-rice"></i>Món cơm</a>
                                    </li>
                                    <li><a href="views/menu_bun.jsp"><i class="fa-solid fa-bowl-food"></i>Món bún</a>
                                    </li>
                                    <li><a href="views/menu_pho.jsp"><i class="fa-solid fa-bowl-food"></i>Món phở</a>
                                    </li>
                                    <li><a href="views/menu_nuoc.jsp"><i class="fa-solid fa-glass-water"></i>Nước</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item"><a href="views/newhome.jsp">Trang chủ</a></li>
                            
                            <li class="menu-item"><a href="views/about.jsp">Giới thiệu</a></li>
                            <li class="menu-item"><a href="views/contact.jsp">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="search">
                        <input type="text" placeholder="Tìm kiếm món ăn">
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
        <div class="form-section">
            <h2>Liên hệ với chúng tôi</h2>
            <div class="form-group">
                <div>
                    <label for="name">Họ và Tên *</label>
                    <input type="text" id="name" placeholder="Nhập tên của bạn.">
                </div>
               
            </div>
            <div class="form-group">
                <div>
                    <label for="email">Email *</label>
                    <input type="email" id="email" placeholder="Nhập địa chỉ email của bạn.">
                </div>
            </div> 
            <div class="form-group">
                
                <div>
                    <label for="subject">Tiêu đề *</label>
                    <input type="text" id="subject" placeholder="Nhập chủ đề.">
                </div>
            </div>
            <div class="form-group">
                <div class="full-width">
                    <label for="message">Nội dung *</label>
                    <textarea id="message" placeholder="Nhập yêu cầu của bạn."></textarea>
                </div>
            </div>
            <button class="submit-btn">Gửi <i class="fas fa-arrow-right"></i></button>
        </div>
        <div class="containerright">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214525515973!2d106.78918677573684!3d10.871281657435551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1704294427338!5m2!1svi!2s"
                height="600" width="620px" style="border: none;" allowfullscreen="" aria-hidden="false"
                tabindex="0"></iframe>
        </div>
        
    </div>
        <div id="container-monban">
            <div class="header-mon">
    
                <div class="tag">Hãy đến với chúng tôi vì chúng tôi có</div>
    
            </div>
            <div class="content_section_bottom">
                <div class="card_bottom">
                    <img src="Images/home/pic1.jpg" />
                    <div class="text">Nguyên liệu tươi mới</div>
                </div>
                <div class="card_bottom">
                    <img src="Images/home/pic2.jpg" />
                    <div class="text">Món ăn ngon miệng</div>
                </div>
                <div class="card_bottom">
                    <img src="Images/home/pic3.jpg" />
                    <div class="text">Đóng gói tiện lợi</div>
                </div>
                <div class="card_bottom">
                    <img src="Images/home/pic4.jpg" />
                    <div class="text">Giao hàng tận nơi</div>
                </div>
    
            </div>
        </div>

    <!-- Xử lý footer -->
    <div id="footer">
        <div class="footer-container">
            <div class="footer-info">
                <div class="left">
                    <p><strong>Địa chỉ:</strong> Khu phố 6, Phường Linh Trung, TP. Thủ Đức, </p>
                    <p style="text-indent: 60px">Tp. Hồ Chí Minh.</p>
                    <p><strong>Giờ mở cửa:</strong> 9h00 - 19h00, hàng ngày</p>
                </div>
                <div class="right">
                    <p><strong>Hotline:</strong> 033 *** 1234</p>
                    <p><strong>Phản ánh chất lượng:</strong> 033***1234</p>
                    <p><strong>Email:</strong> pdaotao@hcmuaf.edu.vn</p>
                    <div class="social-icons">
                        <a href="#" target="_blank"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-social">
                <div class="1">© 2024 Food T^3</div>
                <div class="mid"><a href="#">Chính sách hoạt động</a> | <a href="#">Chính sách bảo mật thông
                        tin</a>
                </div>
            </div>
        </div>
    </div>
    <script src="js/home.js">

    </script>
</body>

</html>