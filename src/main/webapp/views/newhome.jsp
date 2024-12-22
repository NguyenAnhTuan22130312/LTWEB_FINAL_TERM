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
                            <a href="newhome.jsp">
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
                            <a href="views/cart.jsp" class="nav-item">
                                <i class="fa-solid fa-basket-shopping"></i> Giỏ hàng
                            </a>
                            <a href="#" class="count">8</a>
                        </div>
                    </div>

                </div>
                <div class="bottom">
                    <div class="menu">
                        <ul class="menu-list">

                            <li class="menu-item">
                                <a href="allMenu.jsp" class="tabbar"> <i class="fa-solid fa-bars"></i>Thực đơn</a>
                                <ul class="submenu">
                                    <li><a href="allmenu"><i class="fa-solid fa-bowl-rice"></i>Tất cả</a>
                                    </li>
                                    <li><a href="views/menu_com.jsp"><i class="fa-solid fa-bowl-rice"></i>Món cơm</a>
                                    </li>
                                    <li><a href="views/menu_bun.jsp"><i class="fa-solid fa-bowl-food"></i>Món bún</a>
                                    </li>
                                    <li><a href="views/menu_pho.jsp"><i class="fa-solid fa-bowl-food"></i>Món phở</a>
                                    </li>
                                    <li><a href="views/menu_nuoc.jsp"><i class="fa-solid fa-glass-water"></i>Nước</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item"><a href="views/newhome.jsp">Trang chủ</a></li>
                            
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
    </div>

    <div id="container-monban">
        <div class="header-mon">

            <div class="tag">Món được yêu thích</div>

        </div>
        <div id="content_section" class="content_section">

            <!-- Cơm tấm sườn bì chả -->
            <div class="card" onclick="showPopup('popup13')">
                <img src="../Images/Food/Com/Com-tam-suon-bi-cha.png" alt="com tam suon bi cha" />
                <div class="card_content">
                    <h3>Cơm tấm sườn bì chả</h3>
                    <p>25.000đ</p>
                    <a class="btn" href="../html/cart.html" onclick="event.stopPropagation()">
                        Thêm vào giỏ hàng
                      </a>
                </div>
            </div>

            <div id="popup13" class="popup">
                <div class="popup-content">
                    <img src="../Images/Food/Com/Com-tam-suon-bi-cha.png" alt="com tam suon bi cha" />
                    <h3>Cơm tấm sườn bì chả</h3>
                    <p>Giá: 25.000đ</p>
                    <span>
                        Cơm tấm sườn bì chả là món ăn đặc trưng của ẩm thực miền Nam. Sườn
                        nướng thơm ngon, bì giòn và chả lụa béo ngậy được kết hợp với cơm
                        tấm dẻo, tạo nên một món ăn ngon, đậm đà và đầy đủ dinh dưỡng cho
                        bữa ăn.
                    </span>
                   
                    <button class="button-cart" id="add-cart" onclick="window.location.href='../html/cart.html'">
                        Thêm vào giỏ hàng
                    </button>
                    <div class="user-reviews">
                        <h4>Đánh giá từ khách hàng</h4>
                        
                        <!-- Đánh giá 1 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Văn A</p>
                                <p class="review-date">20/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span> <!-- 4 sao -->
                          </div>
                          <p class="review-text">Món này rất ngon, vị rất đặc biệt. Mình rất thích!</p>
                        </div>
                        
                        <!-- Đánh giá 2 -->
                        <div class="review-item">
                            <div class="info-review">
                             <p class="user-name">Trần Thị B</p>
                             <p class="review-date">18/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span> <!-- 5 sao -->
                          </div>
                          <p class="review-text">Mình rất hài lòng với món này.</p>
                        </div>
                        
                        <!-- Đánh giá 3 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Anh Tuấn</p>
                                <p class="review-date">18/11/2024</p>
                               </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span> <!-- 3 sao -->
                          </div>
                          <p class="review-text">Món này khá ngon, rất hợp khẩu vị của mình, sẽ quay lại lần sau.</p>
                        </div>
                      </div>
                </div>
                <span class="close" onclick="closePopup('popup13')">&times;</span>
            </div>

            <!-- Cơm tấm thịt nướng -->
            <div class="card" onclick="showPopup('popup14')">
                <img src="../Images/Food/Com/Com-tam-thit-nuong.png" alt="com tam thit nuong" />
                <div class="card_content">
                    <h3>Cơm tấm thịt nướng</h3>
                    <p>30.000đ</p>
                    <a class="btn" href="../html/cart.html" onclick="event.stopPropagation()">
                        Thêm vào giỏ hàng
                      </a>
                </div>
            </div>

            <div id="popup14" class="popup">
                <div class="popup-content">
                    <img src="../Images/Food/Com/Com-tam-thit-nuong.png" alt="com tam thit nuong" />
                    <h3>Cơm tấm thịt nướng</h3>
                    <p>Giá: 30.000đ</p>
                    <span>
                        Cơm tấm thịt nướng là món ăn đậm đà hương vị, với thịt nướng vàng
                        ươm, mềm, thấm đẫm gia vị. Khi ăn kèm với cơm tấm dẻo và nước mắm
                        pha, món ăn này mang lại cảm giác thỏa mãn, đầy đủ cho một bữa ăn.
                    </span>
                  
                    <button class="button-cart" id="add-cart" onclick="window.location.href='../html/cart.html'">
                        Thêm vào giỏ hàng
                    </button>
                    <div class="user-reviews">
                        <h4>Đánh giá từ khách hàng</h4>
                        
                        <!-- Đánh giá 1 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Văn A</p>
                                <p class="review-date">20/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span> <!-- 4 sao -->
                          </div>
                          <p class="review-text">Món này rất ngon, vị rất đặc biệt. Mình rất thích!</p>
                        </div>
                        
                        <!-- Đánh giá 2 -->
                        <div class="review-item">
                            <div class="info-review">
                             <p class="user-name">Trần Thị B</p>
                             <p class="review-date">18/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span> <!-- 5 sao -->
                          </div>
                          <p class="review-text">Mình rất hài lòng với món này.</p>
                        </div>
                        
                        <!-- Đánh giá 3 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Anh Tuấn</p>
                                <p class="review-date">18/11/2024</p>
                               </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span> <!-- 3 sao -->
                          </div>
                          <p class="review-text">Món này khá ngon, rất hợp khẩu vị của mình, sẽ quay lại lần sau.</p>
                        </div>
                      </div>
                </div>
                <span class="close" onclick="closePopup('popup14')">&times;</span>
            </div>

            <!-- Cơm tấm sườn trứng -->
            <div class="card" onclick="showPopup('popup15')">
                <img src="../Images/Food/Com/Com-tam-suon-trung.png" alt="com tam suon trung" />
                <div class="card_content">
                    <h3>Cơm tấm sườn trứng</h3>
                    <p>30.000đ</p>
                    <a class="btn" href="../html/cart.html" onclick="event.stopPropagation()">
                        Thêm vào giỏ hàng
                      </a>
                </div>
            </div>

            <div id="popup15" class="popup">
                <div class="popup-content">
                    <img src="../Images/Food/Com/Com-tam-suon-trung.png" alt="com tam suon trung" />
                    <h3>Cơm tấm sườn trứng</h3>
                    <p>Giá: 30.000đ</p>
                    <span>
                        Cơm tấm sườn trứng là món ăn phổ biến với sự kết hợp giữa sườn
                        nướng thơm lừng, trứng ốp la mềm và cơm tấm dẻo. Món ăn này không
                        chỉ ngon miệng mà còn rất dễ ăn, thích hợp cho bữa sáng hoặc bữa
                        trưa.
                    </span>
                
                    <button class="button-cart" id="add-cart" onclick="window.location.href='../html/cart.html'">
                        Thêm vào giỏ hàng
                    </button>
                    <div class="user-reviews">
                        <h4>Đánh giá từ khách hàng</h4>
                        
                        <!-- Đánh giá 1 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Văn A</p>
                                <p class="review-date">20/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span> <!-- 4 sao -->
                          </div>
                          <p class="review-text">Món này rất ngon, vị rất đặc biệt. Mình rất thích!</p>
                        </div>
                        
                        <!-- Đánh giá 2 -->
                        <div class="review-item">
                            <div class="info-review">
                             <p class="user-name">Trần Thị B</p>
                             <p class="review-date">18/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span> <!-- 5 sao -->
                          </div>
                          <p class="review-text">Mình rất hài lòng với món này.</p>
                        </div>
                        
                        <!-- Đánh giá 3 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Anh Tuấn</p>
                                <p class="review-date">18/11/2024</p>
                               </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span> <!-- 3 sao -->
                          </div>
                          <p class="review-text">Món này khá ngon, rất hợp khẩu vị của mình, sẽ quay lại lần sau.</p>
                        </div>
                      </div>
                </div>
                <span class="close" onclick="closePopup('popup15')">&times;</span>
            </div>

            <!-- Cơm thịt kho trứng -->
            <div class="card" onclick="showPopup('popup16')">
                <img src="../Images/Food/Com/Com-thit-kho-trung.png" alt="com thit kho trung" />
                <div class="card_content">
                    <h3>Cơm thịt kho trứng</h3>
                    <p>30.000đ</p>
                    <a class="btn" href="../html/cart.html" onclick="event.stopPropagation()">
                        Thêm vào giỏ hàng
                      </a>
                </div>
            </div>

            <div id="popup16" class="popup">
                <div class="popup-content">
                    <img src="../Images/Food/Com/Com-thit-kho-trung.png" alt="com thit kho trung" />
                    <h3>Cơm thịt kho trứng</h3>
                    <p>Giá: 30.000đ</p>
                    <span>
                        Cơm thịt kho trứng là món ăn quen thuộc với sự kết hợp giữa thịt
                        kho mềm ngọt và trứng kho thơm, đậm đà. Nước kho từ thịt và trứng
                        tạo thành một món ăn tuyệt vời khi ăn cùng cơm.
                    </span>
                  
                    <button class="button-cart" id="add-cart" onclick="window.location.href='../html/cart.html'">
                        Thêm vào giỏ hàng
                    </button>
                    <div class="user-reviews">
                        <h4>Đánh giá từ khách hàng</h4>
                        
                        <!-- Đánh giá 1 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Văn A</p>
                                <p class="review-date">20/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span> <!-- 4 sao -->
                          </div>
                          <p class="review-text">Món này rất ngon, vị rất đặc biệt. Mình rất thích!</p>
                        </div>
                        
                        <!-- Đánh giá 2 -->
                        <div class="review-item">
                            <div class="info-review">
                             <p class="user-name">Trần Thị B</p>
                             <p class="review-date">18/11/2024</p>
                            </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span> <!-- 5 sao -->
                          </div>
                          <p class="review-text">Mình rất hài lòng với món này.</p>
                        </div>
                        
                        <!-- Đánh giá 3 -->
                        <div class="review-item">
                            <div class="info-review">
                                <p class="user-name">Nguyễn Anh Tuấn</p>
                                <p class="review-date">18/11/2024</p>
                               </div>
                          <div class="stars">
                            <!-- Số sao đã chấm -->
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9733;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span> <!-- 3 sao -->
                          </div>
                          <p class="review-text">Món này khá ngon, rất hợp khẩu vị của mình, sẽ quay lại lần sau.</p>
                        </div>
                      </div>
                </div>
                <span class="close" onclick="closePopup('popup16')">&times;</span>
            </div>

        </div>
        <div class="xemtatca">
            <a href="../html/menu_com.html">Xem Tất Cả</a>
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
    <script src="${pageContext.request.contextPath}/js/home.js">
    </script>
    <script src="${pageContext.request.contextPath}/js/module_popup_home.js"></script>
</body>

</html>