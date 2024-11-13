// Kiểm tra trạng thái đăng nhập và cập nhật giao diện
function checkLoginStatus() {
    const loggedInUser = JSON.parse(localStorage.getItem("loggedInUser"));
    
    if (loggedInUser) {
        // Hiển thị tên người dùng và menu sau khi đăng nhập
        document.getElementById("login-link").style.display = "none";  // Ẩn nút đăng nhập
        document.getElementById("user-menu").style.display = "block"; // Hiển thị menu người dùng
        
        // Hiển thị tên người dùng
        const userName = document.getElementById("user-name");
        userName.textContent = loggedInUser.email;

        // Kiểm tra xem người dùng có phải là admin không
        const adminLink = document.getElementById("admin-link");
        if (loggedInUser.role === "admin") {
            adminLink.style.display = "block";  // Hiển thị liên kết quản trị nếu là admin
        } else {
            adminLink.style.display = "none"; // Ẩn nếu không phải admin
        }
    } else {
        // Nếu người dùng chưa đăng nhập, hiển thị nút đăng nhập
        document.getElementById("login-link").style.display = "block";
        document.getElementById("user-menu").style.display = "none";
    }
}

// Đăng xuất
document.getElementById("logout").addEventListener("click", function () {
    localStorage.removeItem("loggedInUser");  // Xóa thông tin đăng nhập
    window.location.reload();  // Tải lại trang để cập nhật giao diện
});

// Kiểm tra trạng thái đăng nhập khi trang được tải
checkLoginStatus();
