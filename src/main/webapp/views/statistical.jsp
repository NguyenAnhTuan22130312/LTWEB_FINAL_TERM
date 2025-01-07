<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thống kê</title>
    <link href="Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/statistical.css"/>

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
        <input placeholder="Tìm kiếm tên món..." type="text"/>
        <input
                onblur="(this.type='text')"
                onfocus="(this.type='date')"
                placeholder="Từ"
                type="text"
        />
        <input
                onblur="(this.type='text')"
                onfocus="(this.type='date')"
                placeholder="Đến"
                type="text"
        />
        <div class="icons">
            <i class="fas fa-sort-amount-down"> </i>
            <i class="fas fa-sort-amount-up"> </i>
            <i class="fas fa-sync-alt"> </i>
        </div>
    </div>
    <div class="summary">
        <div class="card">
            <i class="fas fa-utensils"> </i>
            <div class="text">
                <p>Sản phẩm được bán ra</p>
                <p class="number">3</p>
            </div>
        </div>
        <div class="card">
            <i class="fas fa-file-alt"> </i>
            <div class="text">
                <p>Số lượng bán ra</p>
                <p class="number">7</p>
            </div>
        </div>
        <div class="card">
            <i class="fas fa-dollar-sign"> </i>
            <div class="text">
                <p>Doanh thu</p>
                <p class="number">330.000 đ</p>
            </div>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>TÊN MÓN</th>
            <th>SỐ LƯỢNG BÁN</th>
            <th>DOANH THU</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td class="product_name">
                <img
                        alt="Đậu hũ xào nấm chay"
                        height="50"
                        src="../Images/Food/Com/Com-chien-duong-chau.png"
                />
                Cơm chiên dương châu
            </td>
            <td>7</td>
            <td>210.000 đ</td>
            <td>
                <button class="details-button">
                    <i class="fas fa-eye"> </i>
                    CHI TIẾT
                </button>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td class="product_name">
                <img
                        alt="Miến xào rau củ chay"
                        height="50"
                        src="../Images/Food/Com/Com-chien-ga-xoi-mo.png"
                />
                Cơm gà xối mỡ
            </td>
            <td>3</td>
            <td>90.000 đ</td>
            <td>
                <button class="details-button">
                    <i class="fas fa-eye"> </i>
                    CHI TIẾT
                </button>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td class="product_name">
                <img
                        alt="Phở bò tái"
                        height="50"
                        src="../Images/Food/Pho/Pho-bo-tai.png"
                        width="50"
                />
                Phở bò tái
            </td>
            <td>1</td>
            <td>30.000 đ</td>
            <td>
                <button class="details-button">
                    <i class="fas fa-eye"> </i>
                    CHI TIẾT
                </button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
