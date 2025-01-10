// Xử lý phương thức thanh toán
let tienmat = document.querySelector("#tienmat");
let thenganhang = document.querySelector("#thenganhang");
let vidientu = document.querySelector("#vidientu");
let thenganhangGroup = document.querySelector("#thenganhang-group");
let vidientuGroup = document.querySelector("#vidientu-group");

function togglePaymentMethod(method, group) {
  const isActive = method.classList.contains("active");

  // Đặt lại trạng thái của tất cả các phương thức thanh toán
  tienmat.classList.remove("active");
  thenganhang.classList.remove("active");
  vidientu.classList.remove("active");
  thenganhangGroup.style.display = "none";
  vidientuGroup.style.display = "none";

  // Nếu phương thức chưa được kích hoạt thì kích hoạt nó
  if (!isActive) {
    method.classList.add("active");
    if (group) group.style.display = "block";
  }
}

// Sự kiện khi nhấn vào từng phương thức thanh toán
tienmat.addEventListener("click", () => {
  togglePaymentMethod(tienmat);
});

thenganhang.addEventListener("click", () => {
  togglePaymentMethod(thenganhang, thenganhangGroup);
});

vidientu.addEventListener("click", () => {
  togglePaymentMethod(vidientu, vidientuGroup);
});

// Xử lý các ví điện tử
let googlepay = document.querySelector("#google-pay-icon");
let applepay = document.querySelector("#apple-pay-icon");
let amazonpay = document.querySelector("#amazon-pay-icon");
let paypal = document.querySelector("#paypal-icon");

function activateEWallet(selectedWallet) {
  // Đặt lại trạng thái của tất cả các ví điện tử
  [googlepay, applepay, amazonpay, paypal].forEach((wallet) => {
    wallet.classList.remove("active");
  });

  // Kích hoạt ví được chọn
  selectedWallet.classList.add("active");
}

googlepay.addEventListener("click", () => {
  activateEWallet(googlepay);
});

applepay.addEventListener("click", () => {
  activateEWallet(applepay);
});

amazonpay.addEventListener("click", () => {
  activateEWallet(amazonpay);
});

paypal.addEventListener("click", () => {
  activateEWallet(paypal);
});




//Xu ly thong bao
function showOrderSuccess() {
  const modal = document.getElementById("order-success-modal");
  modal.style.display = "flex";
  setTimeout(closeModal, 5000); // Đóng modal sau 3 giây  }
}

