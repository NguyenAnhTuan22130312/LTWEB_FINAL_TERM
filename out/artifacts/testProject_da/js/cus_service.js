// Xử lý popup thêm khách hàng

const popup = document.getElementById("popup");
const addButton = document.querySelector(".add_cus_btn");
const closeButton =  document.querySelector(".close_btn");

addButton.addEventListener("click", () => {
  popup.classList.remove("hidden");
});

closeButton.addEventListener("click", () =>{
  popup.classList.add("hidden");
});

popup.addEventListener("click", (event) => {
  if (event.target === popup) {
    popup.classList.add("hidden");
  }
});

document.getElementById("new_cus_form").addEventListener("submit", (e) => {
  e.preventDefault();
  

  alert("Đã thêm thành công khách hàng mới!");
  popup.classList.add("hidden");
});