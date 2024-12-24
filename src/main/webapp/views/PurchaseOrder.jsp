<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đang vận chuyển</title>
    <link href="../Images/LOGO_V2.png" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" href="css/module_header_footer.css"/>
    <link rel="stylesheet" href="css/signinCssModule.css"/>
    <link rel="stylesheet" href="css/module_container_PurchaseOrder.css"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <script src="js/module_dangnhap.js" defer></script>
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

    <div id="all_purchase" class="section active">
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

    <div id="ondelivering" class="section">
        <div class="order-container">
            <div class="order-card">
                <div class="idDonHang">
                    <i class="fa-regular fa-copy"></i> 123456678
                </div>
                <div class="line_st"></div>
                <div class="product-item">
                    <img
                            src="../Images/Food/Bun/Bun-cha-ha-noi.png"
                            alt="Cơm tấm heo quay"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Bún chả Hà Nội</h3>
                        <p class="product-quantity">Số lượng: 2</p>
                    </div>
                    <div class="product-total">
                        <div class="money">60.000 đ</div>
                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/nuoc/matcha-latte.png"
                            alt="Trà sữa kem trứng cháy"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Matcha Latte</h3>
                        <p class="product-quantity">Số lượng: 1</p>
                    </div>
                    <div class="product-total">
                        <div class="money">30.000 đ</div>
                    </div>
                </div>
                <div class="line_end"></div>
                <div class="order-total">
                    <strong>Tổng tiền:</strong>
                    <span class="total-money">90.000 đ</span>
                </div>
                <div class="order-footer">
                    <div class="order-status">Trạng thái: Đang vận chuyển</div>
                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>
                </div>
            </div>
        </div>
    </div>

    <div id="checkcancelled" class="section">
        <div class="order-container">
            <div class="order-card">
                <div class="idDonHang">
                    <i class="fa-regular fa-copy"></i> 123456678
                </div>
                <div class="line_st"></div>
                <div class="product-item">
                    <img
                            src="../Images/Food/Bun/Bun-cha-ha-noi.png"
                            alt="Cơm tấm heo quay"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Bún chả Hà Nội</h3>
                        <p class="product-quantity">Số lượng: 2</p>
                    </div>
                    <div class="product-total">
                        <div class="money">60.000 đ</div>
                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/nuoc/matcha-latte.png"
                            alt="Trà sữa kem trứng cháy"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Matcha Latte</h3>
                        <p class="product-quantity">Số lượng: 1</p>
                    </div>
                    <div class="product-total">
                        <div class="money">30.000 đ</div>
                    </div>
                </div>
                <div class="line_end"></div>
                <div class="order-total">
                    <strong>Tổng tiền:</strong>
                    <span class="total-money">90.000 đ</span>
                </div>
                <div class="order-footer">
                    <div class="order-status">Trạng thái: Đã Hủy</div>
                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>
                    <button class="buy-again">Mua lại</button>
                </div>
            </div>
        </div>

        <div class="order-container">
            <div class="order-card">
                <div class="idDonHang">
                    <i class="fa-regular fa-copy"></i> 9876543
                </div>
                <div class="line_st"></div>
                <div class="product-item">
                    <img
                            src="../Images/Food/Pho/Pho-hai-san.png"
                            alt="Cơm tấm heo quay"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Phở hải sản</h3>
                        <p class="product-quantity">Số lượng: 1</p>
                    </div>
                    <div class="product-total">
                        <div class="money">30.000 đ</div>
                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/nuoc/Sinh-to-xoai.png"
                            alt="Trà sữa kem trứng cháy"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Sinh tố xoài</h3>
                        <p class="product-quantity">Số lượng: 2</p>
                    </div>
                    <div class="product-total">
                        <div class="money">60.000 đ</div>
                    </div>
                </div>
                <div class="line_end"></div>
                <div class="order-total">
                    <strong>Tổng tiền:</strong>
                    <span class="total-money">90.000 đ</span>
                </div>
                <div class="order-footer">
                    <div class="order-status">Trạng thái: Đã Hủy</div>
                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>
                    <button class="buy-again">Mua lại</button>
                </div>
            </div>
        </div>
    </div>

    <div id="alreadyDelivered" class="section">
        <div class="order-container">
            <div class="order-card">
                <div class="idDonHang">
                    <i class="fa-regular fa-copy"></i> 123456678
                </div>
                <div class="line_st"></div>
                <div class="product-item">
                    <img
                            src="../Images/Food/Com/Com-chien-ga-xoi-mo.png"
                            alt="Cơm gà xối mỡ"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Cơm gà xối mỡ</h3>
                        <p class="product-quantity">Số lượng: 2</p>
                    </div>
                    <div class="product-total">
                        <div class="money">60.000 đ</div>

                    </div>
                </div>

                <div class="product-item">
                    <img
                            src="../Images/Food/Pho/Pho-bo-tai.png"
                            alt="Phở bò tái"
                            class="product-image"
                    />
                    <div class="product-info">
                        <h3 class="product-name">Phở bò tái</h3>
                        <p class="product-quantity">Số lượng: 1</p>
                    </div>
                    <div class="product-total">
                        <div class="money">30.000 đ</div>

                    </div>
                </div>
                <div class="line_end"></div>
                <div class="order-total">
                    <strong>Tổng tiền:</strong>
                    <span class="total-money">90.000 đ</span>
                </div>
                <div class="order-footer">
                    <div class="order-status">Trạng thái: Đã Vận Chuyển</div>
                    <button class="info-order-button comment-button">Đánh giá</button>
                    <button class="info-order-button" onclick="goToDetails()">Chi tiết</button>
                </div>
            </div>
        </div>
    </div>

    <div id="rating-popup" class="popup">
        <div class="popup-content">
            <span class="close-button">&times;</span>
            <h3>Đánh giá đơn hàng</h3>

            <div class="product-rating">
                <div class="product-container">
                    <div class="product-item">
                        <img src="../Images/Food/Com/Com-chien-ga-xoi-mo.png" alt="Cơm gà xối mỡ"
                             class="product-image"/>
                        <div class="product-info">
                            <h4 class="product-name">Cơm gà xối mỡ</h4>
                            <div id="rating-stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <textarea placeholder="Viết nhận xét cho món ăn này..."></textarea>
            </div>

            <div class="product-rating">
                <div class="product-container">
                    <div class="product-item">
                        <img src="../Images/Food/Pho/Pho-bo-tai.png" alt="Phở bò tái" class="product-image"/>
                        <div class="product-info">
                            <h4 class="product-name">Phở bò tái</h4>
                            <div id="rating-stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <textarea placeholder="Viết nhận xét cho món ăn này..."></textarea>
            </div>


            <button class="sendDG">Gửi đánh giá</button>
        </div>
    </div>


</div>

<!-- Xử lý footer -->
<jsp:include page="footer.jsp"></jsp:include>

<script src="js/home.js"></script>
<script src="js/transport.js"></script>
<script src="js/details.js"></script>
<script src="js/module_popup_purchase.js"></script>
</body>
</html>
