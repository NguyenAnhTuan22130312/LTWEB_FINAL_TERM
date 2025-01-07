<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/discount.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
</head>
<body>

<jsp:include page="leftAdmin.jsp"></jsp:include>

<div class="content">
    <div class="header">QUẢN LÝ MÃ GIẢM GIÁ</div>
    <div class="banner-management">
        <h2>Danh sách các mã giảm giá</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Mã giảm giá</th>
                <th>Tỉ lệ giảm giá</th>
                <th>Tiêu đề</th>
                <th>Mô tả</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày hết hạn</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>001</td>
                <td>MUAMOTTANGMOT</td>
                <td>20%</td>
                <td>BLACK FRIDAY</td>
                <td>BLACK FRIDAY mua ngay kẻo hết</td>
                <td>29/11/2024</td>
                <td>10/12/2024</td>
            </tr>

            <tr>
                <td>002</td>
                <td>NOELCANGBUNG</td>
                <td>15%</td>
                <td>Khuyến Mãi Noel</td>
                <td>Nhân dịp Noel hãy dẫn người yêu bạn đi ăn ngay nào</td>
                <td>15/12/2024</td>
                <td>25/12/2024</td>
            </tr>

            <tr>
                <td>003</td>
                <td>KHAITRUONGCUAHANG</td>
                <td>20%</td>
                <td>Khuyến Mãi Đặc Biệt</td>
                <td>Khuyến mãi nhân dịp cửa hàng khai trương</td>
                <td>10/10/2024</td>
                <td>15/10/2024</td>
            </tr>

            </tbody>
        </table>
        <button class="add-banner"><i class="fas fa-plus"></i> Thêm Mã Giảm Giá Mới</button>
    </div>

    <div id="popup" class="popup hidden">
        <div class="popup_content">
          <span class="close_btn">
            <i class="fa-solid fa-xmark"></i> 
          </span>
            <h2>THÊM MÃ GIẢM GIÁ MỚI</h2>
            <form id="new_item_form">

                <label for="dis-code">Mã giảm giá:</label>
                <input type="text" id="dis-code" placeholder="Hãy nhập mã giảm giá...">

                <label for="discount-rate">Tỉ lệ giảm giá (%):</label>
                <input type="number" id="discount-rate" placeholder="Hãy nhập tỉ lệ giảm giá..." min="0" max="100"
                       required>

                <label for="title">Tiêu đề:</label>
                <input type="text" id="title" placeholder="Hãy nhập tiêu đề..." required>

                <label for="description">Mô tả:</label>
                <textarea id="description" placeholder="Hãy nhập mô tả..." rows="3" required></textarea>

                <label for="start-date">Ngày bắt đầu:</label>
                <input type="date" id="start-date" required>

                <label for="end-date">Ngày hết hạn:</label>
                <input type="date" id="end-date" required>

                <button type="submit">Lưu</button>
            </form>
        </div>
    </div>

</div>

<script src="js/admin_popup.js"></script>

</body>
</html>
