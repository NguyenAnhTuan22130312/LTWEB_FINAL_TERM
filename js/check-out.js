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
    item.style.display = "flex";
  });
});

//Xu ly phuong thuc thanh toan
let tienmat = document.querySelector("#tienmat");
let thenganhang = document.querySelector("#thenganhang");
let vidientu = document.querySelector("#vidientu");
let thenganhangGroup = document.querySelector("#thenganhang-group");
let vidientuGroup = document.querySelector("#vidientu-group");
let chkPay = document.querySelectorAll(".chk-pay");

tienmat.addEventListener("click", () => {
  thenganhang.classList.remove("active");
  vidientu.classList.remove("active");
  tienmat.classList.add("active");
  chkPay.forEach((item) => {
    item.style.display = "none";
  });
});

thenganhang.addEventListener("click", () => {
  tienmat.classList.remove("active");
  vidientu.classList.remove("active");
  thenganhang.classList.add("active");
  chkPay.forEach((item) => {
    item.style.display = "none";
  });
  thenganhangGroup.style.display = "block";
});

vidientu.addEventListener("click", () => {
  tienmat.classList.remove("active");
  thenganhang.classList.remove("active");
  vidientu.classList.add("active");
  thenganhangGroup.style.display = "none";
  chkPay.forEach((item) => {
    item.style.display = "none";
  });
  vidientuGroup.style.display = "block";
});
