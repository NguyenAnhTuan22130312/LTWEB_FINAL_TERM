<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food T^3</title>
    <link href='Images/LOGO_V2.png' rel='icon' type='image/x-icon'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newhome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
</head>

<body>
<script src="${pageContext.request.contextPath}/js/module_dangnhap.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<!-- Xử lý content\  -->

<div id="container">
    <div class="w3-content w3-display-container">
        <c:forEach var ="bann" items="${bans}" >
            <img class="mySlides" src="${bann.url}" style="width:100%">
        </c:forEach>
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
    <div id="content_section lst4Sold" class="content_section">
        <c:forEach var="food" items="${lst4Sold}">
            <div class="card" onclick="showPopup('${food.idFood}')">
                <img src="${food.img}" alt="${food.foodName}"/>
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
                    <img src="${food.img}" alt="${food.foodName}"/>
                    <h3>${food.foodName}</h3>
                    <p>Giá: ${food.price}đ</p>
                    <span>
                            ${food.description}
                    </span>
                    <button
                            class="button-cart"
                            onclick="window.location.href='cart.jsp?foodId=${food.idFood}'">
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
    <div id="content_section lst4View" class="content_section">
        <c:forEach var="food" items="${lst4View}">
            <div class="card" onclick="showPopup('${food.idFood}')">
                <img src="${food.img}" alt="${food.foodName}"/>
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
                    <img src="${food.img}" alt="${food.foodName}"/>
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
    <div id="content_section lst4Propose" class="content_section">
        <c:forEach var="food" items="${lst4Propose}">
            <div class="card" onclick="showPopup('${food.idFood}')">
                <img src="${food.img}" alt="${food.foodName}"/>
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
                    <img src="${food.img}" alt="${food.foodName}"/>
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
                <img src="${food.img}" alt="${food.foodName}"/>
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
                    <img src="${food.img}" alt="${food.foodName}"/>
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
            <img src="Images/home/pic1.jpg"/>
            <div class="text">Nguyên liệu tươi mới</div>
        </div>
        <div class="card_bottom">
            <img src="Images/home/pic2.jpg"/>
            <div class="text">Món ăn mgon miệng</div>
        </div>
        <div class="card_bottom">
            <img src="Images/home/pic3.jpg"/>
            <div class="text">Đóng gói tiện lợi</div>
        </div>
        <div class="card_bottom">
            <img src="Images/home/pic4.jpg"/>
            <div class="text">Giao hàng tận nơi</div>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="js/home.js">
</script>
<script src="js/module_popup_home.js"></script>
</body>

</html>