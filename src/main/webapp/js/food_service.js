// Lấy các popup và button
const addPopup = document.getElementById("add_popup");
const updatePopup = document.getElementById("update_popup");
const addButton = document.querySelector(".add_item_btn");
const updateButtons = document.querySelectorAll(".update_item_btn");
const deleteButtons = document.querySelectorAll(".delete_item_btn");
const closeButtons = document.querySelectorAll(".close_btn");

// Đợi DOM load đầy đủ mới gán sự kiện
document.addEventListener("DOMContentLoaded", () => {
    // Hiển thị popup thêm món
    addButton.addEventListener("click", () => {
        addPopup.classList.remove("hidden");
    });

    // Hiển thị popup cập nhật món
    updateButtons.forEach(button => {
        button.addEventListener("click", () => {
            updatePopup.classList.remove("hidden");
        });
    });

    // Đóng popup
    closeButtons.forEach(button => {
        button.addEventListener("click", () => {
            button.closest(".popup").classList.add("hidden");
        });
    });

    // Đóng popup khi click ra ngoài
    [addPopup, updatePopup].forEach(popup => {
        popup.addEventListener("click", (event) => {
            if (event.target === popup) {
                popup.classList.add("hidden");
            }
        });
    });

    // Xử lý form thêm mới món
    const newItemForm = document.getElementById("new_item_form");
    newItemForm.addEventListener("submit", (e) => {
        e.preventDefault();
        alert("Món mới đã được lưu!");
        addPopup.classList.add("hidden");
    });

    // Xử lý form cập nhật món
    const updateItemForm = document.getElementById("update_item_form");
    updateItemForm.addEventListener("submit", (e) => {
        e.preventDefault();
        alert("Đã cập nhật thông tin món!");
        updatePopup.classList.add("hidden");
    });
});
