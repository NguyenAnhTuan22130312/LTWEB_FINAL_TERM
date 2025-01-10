<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thanh toán</title>
    <link href="${pageContext.request.contextPath}/Images/LOGO_V2.png" rel="icon" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/check-out.css" />
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/all.css"/>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/sharp-duotone-solid.css"/>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/sharp-thin.css"/>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/sharp-solid.css"/>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/sharp-regular.css"/>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.6.0/css/sharp-light.css"/>
    <style>
    a{
      text-decoration: none;
      color: white;
    }
    </style>
  </head>
  <body>
    <div class="checkout-page">
      <div class="checkout-header">
        <div class="checkout-return">
          <button>
            <a href="cart" style="text-decoration: none">
              <i class="fa-regular fa-chevron-left"></i>
            </a>
          </button>
        </div>
        <h2 class="checkout-title">Thanh toán</h2>
      </div>
      <main class="checkout-section container">
        <div class="checkout-col-left">
          <div class="checkout-row">
            <div class="checkout-col-title">Thông tin đơn hàng</div>
            <div class="checkout-col-content">

              <div class="content-group">
                <p class="checkout-content-label">Phương thức thanh toán</p>
                <div class="checkout-payment-type">
                  <button class="payment-btn active" id="tienmat">
                    <i class="fa-duotone fa-money-bill"></i>
                    Thanh toán khi nhận hàng
                  </button>
                  <button class="payment-btn" id="thenganhang">
                    <i class="fa-duotone fa-solid fa-credit-card"></i>
                    Thanh toán bằng thẻ ngân hàng
                  </button>
                  <div class="content-group chk-ship" id="thenganhang-group">
                    <div class="content-group">
                      <form action="" class="info-the-ngan-hang">
                        <div class="form-group">
                          <input
                            id="tenchuthe"
                            name="tenchuthe"
                            type="text"
                            placeholder="Tên chủ thẻ"
                            class="form-control"
                          />
                          <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                          <input
                            id="sotk"
                            name="sotk"
                            type="text"
                            placeholder="Số tài khoản"
                            class="form-control"
                          />
                          <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                          <input
                            id="ngayhethan"
                            name="ngayhethan"
                            type="text"
                            placeholder="Ngày hết hạn"
                            class="form-control"
                          />
                          <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                          <input
                            id="cvv"
                            name="cvv"
                            type="text"
                            placeholder="Mã CVV"
                            class="form-control"
                          />
                          <span class="form-message"></span>
                        </div>
                      </form>
                    </div>
                  </div>
                  <button class="payment-btn" id="vidientu">
                    <i class="fa-duotone fa-solid fa-wallet"></i>
                    Thanh toán bằng ví điện tử
                  </button>
                  <div class="content-group chk-ship" id="vidientu-group">
                    <div class="checkout-type-order">
                      <button
                        class="type-wallet-btn active" id="google-pay-icon">
                        <i class="fa-brands fa-google-pay"></i>
                      </button>

                      <button class="type-wallet-btn" id="paypal-icon">
                        <i class="fa-brands fa-paypal"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="content-group">
                <p class="checkout-content-label">Ghi chú đơn hàng</p>
                <textarea
                  type="text"
                  class="note-order"
                  placeholder="Nhập ghi chú"
                ></textarea>
              </div>
            </div>
          </div>
          <div class="checkout-row">
            <div class="checkout-col-title">Thông tin người nhận</div>
            <div class="checkout-col-content">
              <div class="content-group">
                <form action="" class="info-nhan-hang">
                  <div class="form-group">
                    <input
                      id="tennguoinhan"
                      name="tennguoinhan"
                      type="text"
                      placeholder="Tên người nhận"
                      class="form-control"
                      required
                    />
                    <span class="form-message"></span>
                  </div>
                  <div class="form-group">
                    <input
                      id="sdtnhan"
                      name="sdtnhan"
                      type="text"
                      placeholder="Số điện thoại nhận hàng"
                      class="form-control"
                      required
                    />
                    <span class="form-message"></span>
                  </div>
                  <div class="form-group">
                    <input
                      id="diachinhan"
                      name="diachinhan"
                      type="text"
                      placeholder="Địa chỉ nhận hàng"
                      class="form-control chk-ship"
                      required
                    />
                    <span class="form-message"></span>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="checkout-col-right">
          <p class="checkout-content-label">Đơn hàng</p>
          <div class="bill-total" id="list-order-checkout">
            <c:forEach var="item" items="${order.items}">
              <div class="food-total">
                <div class="count">${item.quantity}</div>
                <div class="info-food">
                  <div class="name-food">${item.food.foodName}</div>
                </div>
              </div>
            </c:forEach>

          </div>
          <div class="bill-payment">
            <div class="total-bill-order">
              <div class="priceFlx">
                <div class="text">
                  " Tiền hàng"
                  <span class="count">${order.items.size()} món</span>
                </div>
                <div class="price-detail">
                  <span id="checkout-cart-total">${totalAmount} đ</span>
                </div>
              </div>
              <div class="priceFlx chk-ship">
                <div class="text">Phí vận chuyển</div>
                <div class="price-detail chk-free-ship">
                  <span>30.000&nbsp;đ</span>
                </div>
              </div>
            </div>
            <div class="policy-note">
              Bằng việc bấm vào nút “Đặt hàng”, tôi đồng ý với
              <a href="#" target="_blank">chính sách hoạt động</a>
              của chúng tôi.
            </div>
          </div>
          <div class="total-checkout">
            <div class="text">Tổng tiền</div>
            <div class="price-bill" id="tongtiengiao">
              <div class="price-final" id="checkout-cart-price-final">
                ${totalAmount + 30000}&nbsp;đ

              </div>
            </div>
          </div>
          <button class="complete-checkout-btn" onclick="showOrderSuccess()">
            Đặt hàng
          </button>
        </div>
      </main>
    </div>
    <div id="order-success-modal" class="modal" style="display: none">
      <div class="modal-content">
        <div class="modal-check">
          <i class="fa-solid fa-check fa-2xl"></i>
        </div>
        <p>
          Đặt hàng thành công! <br />
          Đơn hàng của bạn đang được xử lý
        </p>
        <form action="checkout" method="POST">
          <button>
            <a href="home">Đóng</a>
          </button>
        </form>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/check-out.js"></script>
    <script>

    </script>
  </body>
</html>
