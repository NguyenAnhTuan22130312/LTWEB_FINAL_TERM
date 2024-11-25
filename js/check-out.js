//Ngày nhận hàng
let today = new Date();
let ngaymai = new Date();
let ngaykia = new Date();
ngaymai.setDate(today.getDate() + 1);
ngaykia.setDate(today.getDate() + 2);
let dateorderhtml = `<a href="javascript:;" class="pick-date active" data-date="${today}">
        <span class="text">Hôm nay</span>
        <span class="date">${today.getDate()}/${today.getMonth() + 1}</span>
        </a>
        <a href="javascript:;" class="pick-date" data-date="${ngaymai}">
            <span class="text">Ngày mai</span>
            <span class="date">${ngaymai.getDate()}/${
  ngaymai.getMonth() + 1
}</span>
        </a>

        <a href="javascript:;" class="pick-date" data-date="${ngaykia}">
            <span class="text">Ngày kia</span>
            <span class="date">${ngaykia.getDate()}/${
  ngaykia.getMonth() + 1
}</span>
    </a>`;
document.querySelector(".date-order").innerHTML = dateorderhtml;
let pickdate = document.getElementsByClassName("pick-date");
for (let i = 0; i < pickdate.length; i++) {
  pickdate[i].onclick = function () {
    document.querySelector(".pick-date.active").classList.remove("active");
    this.classList.add("active");
  };
}

// Xu ly hinh thuc giao hang
let giaotannoi = document.querySelector("#giaotannoi");
let tudenlay = document.querySelector("#tudenlay");
let tudenlayGroup = document.querySelector("#tudenlay-group");
let chkShip = document.querySelectorAll(".chk-ship");

tudenlay.addEventListener("click", () => {
  giaotannoi.classList.remove("active");
  tudenlay.classList.add("active");
  chkShip.forEach((item) => {
    item.style.display = "none";
  });
  tudenlayGroup.style.display = "block";
});

giaotannoi.addEventListener("click", () => {
  tudenlay.classList.remove("active");
  giaotannoi.classList.add("active");
  tudenlayGroup.style.display = "none";
  chkShip.forEach((item) => {
    item.style.display = "none";
  });
});

// Xu ly phuong thuc thanh toan
let tienmat = document.querySelector("#tienmat");
let thenganhang = document.querySelector("#thenganhang");
let vidientu = document.querySelector("#vidientu");
let thenganhangGroup = document.querySelector("#thenganhang-group");
let vidientuGroup = document.querySelector("#vidientu-group");
let chkPay = document.querySelectorAll(".chk-pay");

function togglePaymentMethod(method, group) {
  const isActive = method.classList.contains("active");
  // Reset trạng thái tất cả phương thức thanh toán
  tienmat.classList.remove("active");
  thenganhang.classList.remove("active");
  vidientu.classList.remove("active");
  thenganhangGroup.style.display = "none";
  vidientuGroup.style.display = "none";
  chkPay.forEach((item) => {
    item.style.display = "none";
  });

  // Nếu đã active thì tắt, nếu chưa thì bật
  if (!isActive) {
    method.classList.add("active");
    if (group) group.style.display = method === vidientu ? "flex" : "block";
  }
}

tienmat.addEventListener("click", () => {
  togglePaymentMethod(tienmat);
});

thenganhang.addEventListener("click", () => {
  togglePaymentMethod(thenganhang, thenganhangGroup);
});

vidientu.addEventListener("click", () => {
  togglePaymentMethod(vidientu, vidientuGroup);
});

//Xu ly vi dien tu
let googlepay = document.querySelector("#google-pay-icon");
let applepay = document.querySelector("#apple-pay-icon");
let amazonpay = document.querySelector("#amazon-pay-icon");
let paypal = document.querySelector("#paypal-icon");
let chkVidientu = document.querySelectorAll(".chk-vidientu");

googlepay.addEventListener("click", () => {
  applepay.classList.remove("active");
  amazonpay.classList.remove("active");
  paypal.classList.remove("active");
  googlepay.classList.add("active");
  chkVidientu.forEach((item) => {
    item.style.display = "none";
  });
});

applepay.addEventListener("click", () => {
  googlepay.classList.remove("active");
  amazonpay.classList.remove("active");
  paypal.classList.remove("active");
  applepay.classList.add("active");
  chkVidientu.forEach((item) => {
    item.style.display = "none";
  });
});

amazonpay.addEventListener("click", () => {
  googlepay.classList.remove("active");
  applepay.classList.remove("active");
  paypal.classList.remove("active");
  amazonpay.classList.add("active");
  chkVidientu.forEach((item) => {
    item.style.display = "none";
  });
});

paypal.addEventListener("click", () => {
  googlepay.classList.remove("active");
  applepay.classList.remove("active");
  amazonpay.classList.remove("active");
  paypal.classList.add("active");
  chkVidientu.forEach((item) => {
    item.style.display = "none";
  });
});

//Xu ly tong tien
const giaotannoiBtn = document.getElementById("giaotannoi");
const tudenlayBtn = document.getElementById("tudenlay");
const tongtiengiao = document.getElementById("tongtiengiao");
const tongtientudenlay = document.getElementById("tongtientudenlay");

tongtiengiao.style.display = "block";
tongtientudenlay.style.display = "none";

giaotannoiBtn.addEventListener("click", function () {
  tongtiengiao.style.display = "block";
  tongtientudenlay.style.display = "none";
});

tudenlayBtn.addEventListener("click", function () {
  tongtientudenlay.style.display = "block";
  tongtiengiao.style.display = "none";
});

//Xu ly thong bao
function showOrderSuccess() {
  const modal = document.getElementById("order-success-modal");
  modal.style.display = "flex";
  setTimeout(closeModal, 5000); // Đóng modal sau 3 giây  }
}

function closeModal() {
  const modal = document.getElementById("order-success-modal");
  modal.style.display = "none";
  console.log("Modal closed");
  window.location.href = "../html/PurchaseOrder.html";
}
