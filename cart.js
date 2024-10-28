// Constants
const VAT_RATE = 31000; // Phí vận chuyển
let discountRate = 0;
let cart = []; // Giỏ hàng chứa các sản phẩm
let selectedProducts = new Set(); // Tập hợp chứa các sản phẩm được chọn để thanh toán

// Hàm cập nhật tổng giỏ hàng
function updateCart() {
  const cartContainer = document.getElementById("cart-items-container");
  cartContainer.innerHTML = ""; // Xóa nội dung cũ

  let subtotal = 0;

  cart.forEach((item, index) => {
    const itemTotal = item.price * item.quantity;

    // Nếu sản phẩm đã được chọn để thanh toán, thì tính tổng
    if (selectedProducts.has(index)) {
      subtotal += itemTotal;
    }

    // Tạo phần tử HTML cho từng sản phẩm dưới dạng hàng bảng
    const cartRow = document.createElement("tr");
    cartRow.innerHTML = `
      <td><input type="checkbox" class="select-product" onchange="toggleProductSelection(${index})" ${
      selectedProducts.has(index) ? "checked" : ""
    }></td>
      <td>${item.name}</td>
      <td><img src="image-placeholder.png" alt="Product Image" class="product-img"></td>
      <td>
        <div class="quantity">
          <button class="qty-btn minus-btn" onclick="changeQuantity(${index}, -1)">-</button>
          <input type="text" value="${
            item.quantity
          }" class="qty-input" min="1" onchange="updateQuantity(${index}, this.value)">
          <button class="qty-btn plus-btn" onclick="changeQuantity(${index}, 1)">+</button>
        </div>
      </td>
      <td>${formatCurrency(item.price)}</td>
      <td class="product-subtotal">${formatCurrency(itemTotal)}</td>
    `;

    cartContainer.appendChild(cartRow);
  });

  const vat = VAT_RATE;
  const total = subtotal + vat - subtotal * discountRate;

  // Cập nhật hiển thị tổng
  document.getElementById("subtotal").innerText = formatCurrency(subtotal);
  document.getElementById("vat").innerText = formatCurrency(vat);
  document.getElementById("total").innerText = formatCurrency(total);
}

// Thêm sản phẩm vào giỏ hàng
function addToCart(product) {
  cart.push(product);
  updateCart();
}

// Thay đổi số lượng sản phẩm
function changeQuantity(index, amount) {
  if (cart[index].quantity + amount >= 1) {
    cart[index].quantity += amount;
  }
  updateCart();
}

// Cập nhật số lượng trực tiếp
function updateQuantity(index, newQuantity) {
  const quantity = parseInt(newQuantity);
  if (!isNaN(quantity) && quantity >= 1) {
    cart[index].quantity = quantity;
    updateCart();
  }
}

// Hàm chọn hoặc bỏ chọn sản phẩm
function toggleProductSelection(index) {
  if (selectedProducts.has(index)) {
    selectedProducts.delete(index); // Nếu đã được chọn thì bỏ chọn
  } else {
    selectedProducts.add(index); // Nếu chưa chọn thì thêm vào danh sách
  }
  updateCart();
}

// Áp dụng mã giảm giá
function applyVoucher() {
  const voucherInput = document.getElementById("voucher").value;
  if (voucherInput === "DISCOUNT10") {
    discountRate = 0.1;
    alert("Mã giảm giá 10% đã được áp dụng!");
  } else {
    discountRate = 0;
    alert("Mã giảm giá không hợp lệ!");
  }
  updateCart();
}

// Định dạng tiền tệ
function formatCurrency(amount) {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(amount);
}

// Hàm xóa sản phẩm đã chọn khỏi giỏ hàng
function removeSelectedProducts() {
  // Lọc lại các sản phẩm không nằm trong selectedProducts
  cart = cart.filter((_, index) => !selectedProducts.has(index));
  selectedProducts.clear(); // Xóa danh sách sản phẩm được chọn
  updateCart(); // Cập nhật lại giỏ hàng
}

// Khởi tạo giỏ hàng mẫu
addToCart({ name: "Cơm sườn", price: 30000, quantity: 1 });
addToCart({ name: "Phở bò", price: 50000, quantity: 1 });
addToCart({ name: "Bún riêu", price: 40000, quantity: 1 });
addToCart({ name: "Bún chả", price: 45000, quantity: 1 });
addToCart({ name: "Bún đậu mắm tôm", price: 35000, quantity: 1 });
addToCart({ name: "Bún ốc", price: 60000, quantity: 1 });
addToCart({ name: "Bún bò Huế", price: 55000, quantity: 1 });
addToCart({ name: "Bún mắm", price: 50000, quantity: 1 });
addToCart({ name: "Bún mọc", price: 45000, quantity: 1 });
addToCart({ name: "Bún cá", price: 65000, quantity: 1 });
addToCart({ name: "Bún chả cá", price: 70000, quantity: 1 });
addToCart({ name: "Bún chả cá thìa", price: 75000, quantity: 1 });
addToCart({ name: "Bún chả cá lóc", price: 80000, quantity: 1 });
