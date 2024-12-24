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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
</head>

<body>
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js"></script>
    <div id="header">
        <div class="containerheaderAll">
            <div class="containers">
                <div class="containerss">
                    <div class="left">
                        <div class="logo">
                            <a href="home">
                                <img src="Images/LOGO_V2.png" alt="Food store của Trung, Atuan, Atuan">
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
                                <a href="allmenu?option=tatca" class="tabbar"> <i class="fa-solid fa-bars"></i>Thực đơn</a>
                                <ul class="submenu">
                                    <li><a href="allmenu?option=tatca"><i class="fa-solid fa-bowl-rice"></i>Tất cả</a>
                                    </li>
                                    <li><a href="allmenu?option=1"><i class="fa-solid fa-bowl-rice"></i>Món cơm</a>
                                    </li>
                                    <li><a href="allmenu?option=2"><i class="fa-solid fa-bowl-food"></i>Món bún</a>
                                    </li>
                                    <li><a href="allmenu?option=3"><i class="fa-solid fa-bowl-food"></i>Món phở</a>
                                    </li>
                                    <li><a href="allmenu?option=4"><i class="fa-solid fa-glass-water"></i>Nước</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item"><a href="home">Trang chủ</a></li>
                            
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

    <div id="container">
        <div class="w3-content w3-display-container">
            <img class="mySlides" src="Images/home/qc1.jpg" style="width:100%">
            <img class="mySlides" src="Images/home/qc2.jpg" style="width:100%">
            <img class="mySlides" src="Images/home/qc3.jpg" style="width:100%">
        </div>

        <button class="w3-button w3-black left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-black right" onclick="plusDivs(1)">&#10095;</button>

        <div class="dot-container">
            <span class="dot" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>

        </div>
    </div>
    <div id="container-monban">
        <div class="header-mon">
            <div class="tag">Món Bán Chạy</div>
        </div>
        <div id="content_section" class="content_section">
            <c:forEach var="food" items="${lst4Sold}">
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
        <div class="xemtatca">
            <a href="allmenu?option=banchay">Xem Tất Cả</a>
        </div>
    </div>
    <!-- Mon duoc quan tam-->
    <div id="container-monban">
        <div class="header-mon">
            <div class="tag">Món được quan tâm nhiều</div>
        </div>
        <div id="content_section" class="content_section">
            <c:forEach var="food" items="${lst4View}">
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
        <div class="xemtatca">
            <a href="allmenu?option=quantam">Xem Tất Cả</a>
        </div>
    </div>

    <div id="container-monban">
        <div class="header-mon">
            <div class="tag">Món được đè xuất</div>
        </div>
        <div id="content_section" class="content_section">
            <c:forEach var="food" items="${lst4Propose}">
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
        <div class="xemtatca">
            <a href="allmenu?option=dexuat">Xem Tất Cả</a>
        </div>
    </div>

    <div id="container-monban">
        <div class="header-mon">
            <div class="tag">Món được đánh giá cao</div>
        </div>
        <div id="content_section" class="content_section">
            <c:forEach var="food" items="${lst4Rate}">
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
        <div class="xemtatca">
            <a href="allmenu?option=danhgiacao">Xem Tất Cả</a>
        </div>
    </div>

    <div id="container-monban">
        <div class="header-mon">

            <div class="tag">Tại sao nên chọn Food T^3</div>

        </div>
        <div class="content_section_bottom">
            <div class="card_bottom">
                <img src="Images/home/pic1.jpg" />
                <div class="text">Nguyên liệu tươi mới</div>
            </div>
            <div class="card_bottom">
                <img src="Images/home/pic2.jpg" />
                <div class="text">Món ăn mgon miệng</div>
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
                <div class="mid"><a href="#">Chính sách hoạt động</a> | <a href="#">Chính sách bảo mật thông tin</a>
                </div>
            </div>
        </div>
    </div>
    <script src="js/home.js">
    </script>
    <script src="js/module_popup_home.js"></script>
</body>

</html>