<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thông tin khách hàng</title>
    <link href="${pageContext.request.contextPath}/Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_header_footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_informationuser.css"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
</head>


<body>
<jsp:include page="header.jsp"></jsp:include>


<!-- Xử lý content\  -->
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="usernamediv">Thông tin</div>
        <div class="linename"></div>
        <ul>
            <li>
                <a href="#" onclick="showContent('profile')">
                    <i class="fas fa-id-card"></i>
                    <div class="namemenu">Hồ Sơ</div>
                </a>
            </li>
            <li>
                <a href="#" onclick="showContent('address')">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="namemenu">Địa Chỉ</div>
                </a>
            </li>
            <li>
                <a href="#" onclick="showContent('password')">
                    <i class="fas fa-lock"></i>
                    <div class="namemenu">Đổi Mật Khẩu</div>
                </a>
            </li>
            <li>
                <a href="order">
                    <i class="fas fa-shopping-cart"></i>
                    <div class="namemenu">Đơn Mua</div>
                </a>
            </li>
            <li>
                <a href="#" onclick="showContent('voucher')">
                    <i class="fas fa-ticket-alt"></i>
                    <div class="namemenu">Kho Voucher</div>
                </a>
            </li>
        </ul>
    </div>
    <!-- Content -->
    <div class="content">
        <!-- Hồ Sơ -->
        <div id="profile" class="content-section">
            <h2>Hồ Sơ Của Tôi</h2>
            <div class="linehead"></div>
            <form action="AccDetail" method="post">
                <div class="form-group">
                    <label> Tên đăng nhập </label>
                    <input id="username" name="userName"  type="text" value="${account.userName}" readonly/>
                </div>
                <div class="form-group">
                    <label> Tên </label>
                    <input id="name" name="fullName" type="text" value="${accDetail.fullName}"/>
                </div>
                <div class="form-group">
                    <label> Email </label>
                    <input id="email" name="email" type="email" value="${account.email}" readonly/>
                </div>
                <div class="form-group">
                    <label> Số điện thoại </label>
                    <input id="phone" name="phoneNumber"  type="text" value="${accDetail.phoneNumber}"/>
                </div>
                <div class="form-group">
                    <label> Ngày sinh </label>
                    <input id="birthdate" name="birthDate" type="date" value="${accDetail.birthDate}"/>
                </div>
                <div class="form-group">
                    <label> Giới tính </label>
                    <div class="gender-picker">
                        <label>Giới tính:</label>
                        <input type="radio" id="male" name="gender" value="0" ${accDetail.gender == 0 ? "checked" : ""}>
                        <label for="male">Nam</label>
                        <input type="radio" id="female" name="gender" value="1" ${accDetail.gender == 1 ? "checked" : ""}>
                        <label for="female">Nữ</label>
                        <input type="radio" id="other" name="gender" value="2" ${accDetail.gender == 2 ? "checked" : ""}>
                        <label for="other">Khác</label>
                    </div>
                </div>
                <div class="form-group">
                    <button id="edit-save-btn" type="submit">Lưu</button>


                </div>
            </form>
        </div>
        <!-- Địa Chỉ -->
        <div id="address" class="content-section hidden">
            <h2>Địa Chỉ Của Tôi</h2>
            <div class="linehead"></div>
            <form>
                <div class="form-group">
                    <label for="inplocate">Địa chỉ nhận hàng</label>
                    <textarea id="inplocate"  class="inplocate">123 Đường ABC, Quận X</textarea>
                    <button id="edit-save-textarea-btn" type="button">Lưu</button>
                </div>


            </form>
        </div>
        <!-- Đổi Mật Khẩu -->
        <div id="password" class="content-section hidden">
            <h2>Đổi Mật Khẩu</h2>
            <div class="linehead"></div>
            <form>
                <div class="form-group">
                    <label> Mật khẩu mới </label>
                    <input type="password" placeholder="Nhập mật khẩu mới"/>
                </div>
                <div class="form-group">
                    <label> Xác nhận mật khẩu </label>
                    <input type="password" placeholder="Nhập lại mật khẩu mới"/>
                </div>
                <div class="form-group">
                    <button class="save-btn" type="submit">Lưu</button>
                </div>
            </form>
        </div>
        <!-- Kho Voucher -->
        <div id="voucher" class="content-section hidden">
            <h2>Kho Voucher</h2>
            <div class="linehead"></div>
            <p>Không có voucher nào!</p>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/UserInformation.js"></script>


</body>
</html>
