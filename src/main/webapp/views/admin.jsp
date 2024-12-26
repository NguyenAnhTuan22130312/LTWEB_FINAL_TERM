<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <img alt="admin" src="Images/LOGO_V2.png"/>
        <h2>T^3 Restaurant</h2>
        <ul>
            <li>
                <a class="active" href="admin">
                    <i class="fas fa-home"> </i>
                    Trang tổng quan
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/food_service.jsp">
                    <i class="fas fa-utensils"> </i>
                    Sản phẩm
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/banner.jsp">
                    <i class="fas fa-image">
                    </i>
                    Quản lý Banner
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/customer_sevice.jsp">
                    <i class="fas fa-users"> </i>
                    Khách hàng
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/order.jsp">
                    <i class="fas fa-shopping-cart"> </i>
                    Đơn hàng
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/statistical.jsp">
                    <i class="fas fa-chart-bar"> </i>
                    Thống kê
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/views/discount.jsp">
                    <i class="fas fa-chart-bar"> </i>
                    Quản lý mã giảm giá
                </a>
            </li>

            <li>
                <a id="logout" href="views/newhome.jsp">
                    <i class="fas fa-sign-out-alt"> </i>
                    Đăng xuất
                </a>

            </li>
        </ul>
    </div>
    <div class="content">
        <div class="header">KHÁCH HÀNG LÀ THƯỢNG ĐẾ</div>

        <div class="store-management">
            <h2>Quản lý cửa hàng</h2>
            <div class="cards">
                <div class="card">
                    <img
                            alt="Illustration of a person holding a shopping bag"
                            height="100"
                            src="${pageContext.request.contextPath}/Images/logo/admin_logo_cus.jpg"

                    />
                    <div class="number">3</div>
                    <h3>Khách hàng</h3>
                </div>
                <div class="card">
                    <img
                            alt="Illustration of a person holding shopping bags"
                            height="100"
                            src="${pageContext.request.contextPath}/Images/logo/admin_logo_food2.jpg"

                    />
                    <div class="number">${totalFoods}</div>
                    <h3>Sản phẩm</h3>
                </div>
                <div class="card">
                    <img
                            alt="Illustration of a person using a mobile phone"
                            height="100"
                            src="${pageContext.request.contextPath}/Images/logo/admin_logo_money.jpg"

                    />
                    <div class="number">330.000đ</div>
                    <h3>Doanh thu</h3>
                </div>
            </div>
        </div>

        <div class="best-sellers">
            <h2>Món ăn bán chạy nhất</h2>
            <div class="best-seller-cards">
                <c:forEach var="food" items="${lst4Sold}">
                    <div class="best-seller-card">
                        <img src="${food.img}"
                             alt="${food.foodName}"/>
                        <h3>${food.foodName}</h3>
                        <p>Đã bán: 7 suất</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/module_dangnhap.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
