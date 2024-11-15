// Tạo các tài khoản giả
const accounts = {
    "admin@gmail.com": { password: "123", role: "admin" },
    "user@gmail.com": { password: "123", role: "user" },
};

// Hàm xử lý đăng nhập
function login() {
    const emailInput = document.querySelector('.sign-in-container input[type="email"]');
    const passwordInput = document.querySelector('.sign-in-container input[type="password"]');
    const email = emailInput ? emailInput.value : '';
    const password = passwordInput ? passwordInput.value : '';

    // Kiểm tra thông tin đăng nhập
    if (accounts[email] && accounts[email].password === password) {
        // Lưu trạng thái đăng nhập vào localStorage
        localStorage.setItem("loggedInUser", JSON.stringify({ email: email, role: accounts[email].role, password: password }));
        // Chuyển hướng về trang chủ
        window.location.href = "../html/newhome.html";
    } else {
        alert("Email hoặc mật khẩu không đúng. Vui lòng thử lại.");
    }
}

// Gán sự kiện cho nút Đăng nhập
document.querySelector('.sign-in-container form').addEventListener("submit", function(event) {
    event.preventDefault(); // Ngăn gửi form
    login();
});
