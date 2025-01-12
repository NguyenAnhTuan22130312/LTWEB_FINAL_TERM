<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đang vận chuyển</title>
    <link href="${pageContext.request.contextPath}/Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_header_footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinCssModule.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/module_container_PurchaseOrder.css"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <script src="${pageContext.request.contextPath}/js/module_dangnhap.js" defer></script>
</head>

<body>
<script src="${pageContext.request.contextPath}/js/module_dangnhap.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<!-- Xử lý container -->
<div id="containe">
    <div class="order-status-container">
        <button class="status-button" id="btn_all" onclick="showSection('all_purchase')">Tất cả</button>
        <button class="status-button" id="btn_transport" onclick="showSection('ondelivering')">Đang vận chuyển</button>
        <button class="status-button" id="btn_delivered" onclick="showSection('alreadyDelivered')">Đã vận chuyển
        </button>
        <button class="status-button" id="btn_cancelled" onclick="showSection('checkcancelled')">Đã hủy</button>
    </div>

    <div class="search-box-container">
        <input
                type="text"
                placeholder="Tìm kiếm đơn hàng..."
                class="search-input"
        />
        <button class="search-button">Tìm kiếm</button>
    </div>

    <div id="content_section">

        <div class="order-container">
            <div class="order-card">
                <div class="idDonHang">
                    <i class="fa-regular fa-copy"></i> 123456678
                </div>
                <div class="line_st"></div>
                <div class="product-item">
                    <img
                            src="../Images/Food/Pho/Pho-bo-tai.png"
                            alt="Pho"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Phở bò tái</h3>
                        <p class="product-quantity">Số lượng: 1</p>
                    </div>
                    <div class="product-total">
                        <div class="money">35.000&nbsp;đ</div>
                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/Bun/Bun-thit-nuong.png"
                            alt="Bun"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Bún thịt nướng</h3>
                        <p class="product-quantity">Số lượng: 3</p>
                    </div>
                    <div class="product-total">
                        <div class="money">75.000&nbsp;đ</div>
                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/Nuoc/Tra_chanh_gia_tay.png"
                            alt="Tra chanh"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Trà chanh giã tay</h3>
                        <p class="product-quantity">Số lượng: 4</p>
                    </div>
                    <div class="product-total">
                        <div class="money">80.000&nbsp;đ</div>
                    </div>
                </div>
                <div class="line_end"></div>
                <div class="order-total">
                    <strong>Tổng tiền:</strong>
                    <span class="total-money">190.000&nbsp;đ</span>
                </div>
                <div class="order-footer">
                    <div class="order-status">Trạng thái: Đang xử lý</div>
                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>
                    <button class="cancel-order-button">Hủy đơn hàng</button>
                </div>
            </div>
        </div>

    </div>

<%--    <div id="all_purchase" class="section active">--%>
<%--        <div class="order-container">--%>
<%--            <div class="order-card">--%>
<%--                <div class="idDonHang">--%>
<%--                    <i class="fa-regular fa-copy"></i> 123456678--%>
<%--                </div>--%>
<%--                <div class="line_st"></div>--%>
<%--                <div class="product-item">--%>
<%--                    <img--%>
<%--                            src="../Images/Food/Pho/Pho-bo-tai.png"--%>
<%--                            alt="Pho"--%>
<%--                            class="product-image"--%>
<%--                    />--%>
<%--                    <div class="product-info">--%>
<%--                        <h3 class="product-name">Phở bò tái</h3>--%>
<%--                        <p class="product-quantity">Số lượng: 1</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-total">--%>
<%--                        <div class="money">35.000&nbsp;đ</div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="product-item">--%>
<%--                    <img--%>
<%--                            src="../Images/Food/Bun/Bun-thit-nuong.png"--%>
<%--                            alt="Bun"--%>
<%--                            class="product-image"--%>
<%--                    />--%>
<%--                    <div class="product-info">--%>
<%--                        <h3 class="product-name">Bún thịt nướng</h3>--%>
<%--                        <p class="product-quantity">Số lượng: 3</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-total">--%>
<%--                        <div class="money">75.000&nbsp;đ</div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="product-item">--%>
<%--                    <img--%>
<%--                            src="../Images/Food/Nuoc/Tra_chanh_gia_tay.png"--%>
<%--                            alt="Tra chanh"--%>
<%--                            class="product-image"--%>
<%--                    />--%>
<%--                    <div class="product-info">--%>
<%--                        <h3 class="product-name">Trà chanh giã tay</h3>--%>
<%--                        <p class="product-quantity">Số lượng: 4</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-total">--%>
<%--                        <div class="money">80.000&nbsp;đ</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="line_end"></div>--%>
<%--                <div class="order-total">--%>
<%--                    <strong>Tổng tiền:</strong>--%>
<%--                    <span class="total-money">190.000&nbsp;đ</span>--%>
<%--                </div>--%>
<%--                <div class="order-footer">--%>
<%--                    <div class="order-status">Trạng thái: Đang xử lý</div>--%>
<%--                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>--%>
<%--                    <button class="cancel-order-button">Hủy đơn hàng</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>


</div>

<!-- Xử lý footer -->
<jsp:include page="footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/js/home.js"></script>
<script src="${pageContext.request.contextPath}/js/transport.js"></script>
<script src="${pageContext.request.contextPath}/js/details.js"></script>
<script src="${pageContext.request.contextPath}/js/module_popup_purchase.js"></script>
</body>
</html>
