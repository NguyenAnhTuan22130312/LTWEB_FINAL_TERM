const itemsperpage = 10;
const items = document.querySelectorAll("#content_section .card");
const pageCount = Math.ceil(items.length / itemsperpage);

const currentPage = 1;

function showPage(page) {
  items.forEach((item) => (item.style.display = "none"));
  const start = (page - 1) * itemsperpage;
  const end = start + itemsperpage;

  for (let i = start; i < end && i < items.length; i++) {
    items[i].style.display = "block";
  }
  updatePagination(page);
}

function updatePagination(page) {
  const pagination = document.querySelector(".pagination");
  pagination.innerHTML = "";

  if (page > 1) {
    const prev = document.createElement("a");
    prev.href = "";
    prev.innerHTML = "<";
    prev.onclick = () => showPage(page - 1);
    pagination.appendChild(prev);
  }

  for (let i = 1; i <= pageCount; i++) {
    const pageLink = document.createElement("a");
    pageLink.href = "#";
    pageLink.innerHTML = i;
    pageLink.className = i === page ? "active" : "";
    pageLink.onclick = () => showPage(i);
    pagination.appendChild(pageLink);
  }

  if (page < pageCount) {
    const next = document.createElement("a");
    next.href = "#";
    next.innerHTML = ">";
    next.onclick = () => showPage(page + 1);
    pagination.appendChild(next);
  }
}

showPage(1);

function showPopup(popupId) {
  // Ẩn tất cả các pop-up
  var popups = document.querySelectorAll(".popup");
  popups.forEach(function (popup) {
    popup.style.display = "none";
  });

  // Hiển thị pop-up của sản phẩm được chọn
  document.getElementById(popupId).style.display = "flex";
}

function closePopup(popupId) {
  document.getElementById(popupId).style.display = "none";
}
