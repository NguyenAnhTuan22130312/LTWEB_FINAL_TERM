document.querySelector(".submit-btn").addEventListener("click", function (e) {
    e.preventDefault(); // Ngăn form gửi đi trước khi kiểm tra

    let isValid = true;

    // Kiểm tra các trường nhập liệu
    const nameField = document.getElementById("name");
    if (!nameField.value.trim()) {
        nameField.placeholder = "Họ và Tên không được để trống.";
        nameField.classList.add("error");
        isValid = false;
    } else {
        nameField.classList.remove("error");
    }

    const emailField = document.getElementById("email");
    if (!emailField.value.trim() || !validateEmail(emailField.value)) {
        emailField.placeholder = "Vui lòng nhập email hợp lệ.";
        emailField.classList.add("error");
        isValid = false;
    } else {
        emailField.classList.remove("error");
    }

    const subjectField = document.getElementById("subject");
    if (!subjectField.value.trim()) {
        subjectField.placeholder = "Tiêu đề không được để trống.";
        subjectField.classList.add("error");
        isValid = false;
    } else {
        subjectField.classList.remove("error");
    }

    const messageField = document.getElementById("message");
    if (!messageField.value.trim()) {
        messageField.placeholder = "Nội dung không được để trống.";
        messageField.classList.add("error");
        isValid = false;
    } else {
        messageField.classList.remove("error");
    }

    // Gửi form nếu hợp lệ
    if (isValid) {
        alert("cảm ơn vì đã liên hệ với chúng tôi");
        // document.querySelector("form").submit(); // Gửi form
    }
});

// Hàm kiểm tra định dạng email
function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Loại bỏ thông báo lỗi khi người dùng bắt đầu nhập
document.querySelectorAll(".input-field").forEach(field => {
    field.addEventListener("input", function () {
        field.classList.remove("error");
        field.placeholder = `Nhập ${field.getAttribute("name")}.`;
    });
});
document.getElementById("contactForm").addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn không cho form submit theo cách mặc định

    const formData = new FormData(this);

    fetch("/contactControll", {
        method: "POST",
        body: formData,
    })
        .then(response => response.text())
        .then(data => {
            // Hiển thị thông báo trả về từ server
            document.getElementById("responseMessage").innerHTML = `<div class="alert alert-success">Gửi liên hệ thành công!</div>`;
            this.reset(); // Xóa nội dung form sau khi gửi thành công
        })
        .catch(error => {
            console.error("Lỗi:", error);
            document.getElementById("responseMessage").innerHTML = `<div class="alert alert-danger">Gửi liên hệ thất bại, vui lòng thử lại!</div>`;
        });
});

