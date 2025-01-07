<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Food Service</title>
    <link href='${pageContext.request.contextPath}/Images/LOGO_V2.png' rel='icon' type='image/x-icon'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/food_service.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
</head>

<body>

<jsp:include page="leftAdmin.jsp"></jsp:include>

<div class="content">
    <div class="header">
        <select id="menu_filter" onchange="location.href=this.value;">
            <option value="foodservice?option=tatca"
            ${currentCategory == null || currentCategory == 'tatca' ? 'selected' : ''}>
                Tất cả
            </option>
            <c:forEach var="category" items="${listC}">
                <option value="foodservice?option=${category.idCategory}"
                    ${currentCategory == category.idCategory.toString() ? 'selected' : ''}>
                        ${category.nameCategory}
                </option>
            </c:forEach>
        </select>

        <input placeholder="Tìm kiếm tên món..." type="text"/>

        <button class="add_item_btn">
            + Thêm món mới
        </button>
    </div>

    <%-- Thêm món mới --%>
    <div id="add_popup" class="popup hidden">
        <div class="popup_content">
          <span class="close_btn">
            <i class="fa-solid fa-xmark"></i>
          </span>
            <h2>THÊM MÓN MỚI</h2>
            <form id="new_item_form">
                <label for="item_name">Tên Món:</label>
                <input type="text" id="item_name" placeholder="Nhập tên món ăn..." required>

                <label for="item_category">Loại Món:</label>
                <select id="item_category">
                    <c:forEach var="category" items="${listC}">
                        <option value="${category.idCategory}">${category.nameCategory}</option>
                    </c:forEach>
                </select>

                <label for="item_price"> Giá:</label>
                <input type="text" id="item_price" placeholder="Nhập giá của món ăn:" required>

                <label for="item_details">Chi tiết món ăn:</label>
                <input type="text" id="item_details" placeholder="Nhập chi tiết món ăn:" required>

                <label for="item_image">Hình ảnh:</label>
                <input type="file" id="item_image">

                <button type="submit">Lưu</button>
            </form>
        </div>
    </div>

    <%-- Cập nhật thông tin món --%>
    <div id="update_popup" class="popup hidden">
        <div class="popup_content">
          <span class="close_btn">
            <i class="fa-solid fa-xmark"></i>
          </span>
            <h2>CẬP NHẬT MÓN</h2>
            <form id="update_item_form">
                <label for="item_name">Tên Món:</label>
                <input type="text" id="items_name" placeholder="Nhập tên món ăn..." required>

                <label for="item_category">Loại Món:</label>
                <select id="items_category">
                    <c:forEach var="category" items="${listC}">
                        <option value="${category.idCategory}">${category.nameCategory}</option>
                    </c:forEach>
                </select>

                <label for="item_price"> Giá:</label>
                <input type="text" id="items_price" placeholder="Nhập giá của món ăn:" required>

                <label for="item_details">Chi tiết món ăn:</label>
                <input type="text" id="items_details" placeholder="Nhập chi tiết món ăn:" required>

                <label for="item_image">Hình ảnh:</label>
                <input type="file" id="items_image">

                <button type="submit">Lưu</button>
            </form>
        </div>
    </div>

    <div class="menu_container">
        <c:forEach var="food" items="${list}">
            <div class="menu-item">
                <img alt="${food.foodName}" height="100" src="${food.img}"/>
                <div class="details">
                    <h3>
                            ${food.foodName}
                    </h3>
                    <p>
                            ${food.description}
                    </p>
                    <button>
                        <c:forEach var="category" items="${listC}">
                            <c:if test="${category.idCategory == food.idCategory}">
                                ${category.nameCategory}
                            </c:if>
                        </c:forEach>
                    </button>
                </div>
                <div class="price">
                        ${food.price}
                </div>
                <div class="actions">
                    <button class="update_item_btn">
                        <i class="fas fa-edit">
                        </i>
                    </button>
                    <button class="delete_item_btn">
                        <i class="fas fa-trash">
                        </i>
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="pagi" style="width:1200px;margin:0px auto; padding-left:35px; text-align:center;">
        <c:if test="${currentPage > 1}">
            <a onclick="" href="foodservice?option=${param.option}&page=${currentPage - 1}"><</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="foodservice?option=${param.option}&page=${i}"
               class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="foodservice?option=${param.option}&page=${currentPage + 1}">></a>
        </c:if>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/food_service.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/module_search_ajax.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/test_module_load_ajax.js"></script>--%>

</body>
</html>