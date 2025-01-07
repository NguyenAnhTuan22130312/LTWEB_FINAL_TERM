<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Service</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer_service.css"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
</head>
<body>

<jsp:include page="leftAdmin.jsp"></jsp:include>

<div class="content">
    <div class="header">
        <select>
            <option>Tất cả</option>
        </select>
        <input placeholder="Tìm kiếm khách hàng..." type="text"/>
        <input placeholder="mm/dd/yyyy" type="text"/>
        <input placeholder="mm/dd/yyyy" type="text"/>

        <button class="add_cus_btn">
            <i class="fas fa-plus"> </i>
            Thêm khách hàng
        </button>
    </div>

    <div id="popup" class="popup hidden">
        <div class="popup_content">
            <span class="close_btn">
              <i class="fa-solid fa-xmark"></i>
            </span>
            <h2>THÊM KHÁCH HÀNG</h2>
            <form id="new_cus_form">
                <label for="cus_name">Tên Khách Hàng:</label>
                <input type="text" id="cus_name" placeholder="Nhập tên khách hàng..." required>

                <label for="cus_gender">Giới tính:</label>
                <div id="cus_gender" class="gender-options">
                    <label>
                        <input type="radio" name="gender" value="male" required>
                        Nam
                    </label>
                    <label>
                        <input type="radio" name="gender" value="female" required>
                        Nữ
                    </label>
                </div>

                <label for="cus_dob">Ngày sinh:</label>
                <input type="date" id="cus_dob" required>

                <label for="cus_address">Địa chỉ:</label>
                <input type="text" id="cus_address" placeholder="Nhập địa chỉ khách hàng..." required>

                <label for="cus_phone">Số Điện thoại:</label>
                <input type="text" id="cus_phone" placeholder="Nhập số điện thoại..." required>

                <label for="cus_email">Email:</label>
                <input type="email" id="cus_email" placeholder="Nhập email khách hàng..." required>


                <button type="submit">
                    Thêm Khách Hàng Mới
                </button>

            </form>
        </div>
    </div>


    <table>
        <thead>
        <tr>
            <th>STT</th>

            <th>HỌ VÀ TÊN</th>

            <th>GIỚI TÍNH</th>

            <th>NGÀY SINH</th>

            <th>ĐỊA CHỈ</th>

            <th>LIÊN HỆ</th>

            <th>EMAIL</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="listAcc" items="${listAcc}">
            <tr>
                <td>${listAcc.idAcc}</td>
                <td>${listAcc.fullName}</td>
                <td>${listAcc.gender}</td>
                <td>${listAcc.birthDate}</td>
                <td>${listAcc.address}</td>
                <td>${listAcc.address}</td>
                <td>${listAcc.email != null ? listAcc.email : 'Không có email'}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/cus_service.js"></script>
</body>
</html>