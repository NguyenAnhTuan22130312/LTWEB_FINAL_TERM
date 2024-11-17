document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 4; // Số món trên mỗi trang
  const menuItems = document.querySelectorAll('.menu-item');
  const pageNumbers = document.querySelectorAll('.page-number');
  const prevButton = document.querySelector('.prev');
  const nextButton = document.querySelector('.next');
  
  let currentPage = 1;

  function showPage(page) {
    // Ẩn tất cả các món ăn
    menuItems.forEach((item, index) => {
      item.style.display = 'none';
      if (index >= (page - 1) * itemsPerPage && index < page * itemsPerPage) {
        item.style.display = 'block';
      }
    });

    // Cập nhật các link phân trang
    pageNumbers.forEach((pageNumber) => {
      pageNumber.classList.remove('active');
    });
    const activePage = document.querySelector(`.page-number[data-page="${page}"]`);
    if (activePage) {
      activePage.classList.add('active');
    }
  }

  // Xử lý sự kiện nhấp vào link phân trang
  pageNumbers.forEach((pageNumber) => {
    pageNumber.addEventListener('click', function (e) {
      currentPage = parseInt(e.target.getAttribute('data-page'));
      showPage(currentPage);
    });
  });

  // Xử lý nút "trước"
  prevButton.addEventListener('click', function () {
    if (currentPage > 1) {
      currentPage--;
      showPage(currentPage);
    }
  });

  // Xử lý nút "sau"
  nextButton.addEventListener('click', function () {
    if (currentPage < pageNumbers.length) {
      currentPage++;
      showPage(currentPage);
    }
  });

  // Hiển thị trang đầu tiên
  showPage(currentPage);
});
