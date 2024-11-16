function toggleEdit(container) {
    const isEditing = container.classList.toggle("editing");
    const inputs = container.querySelectorAll(".inp, .inplocate");
    const toggleButton = container.querySelector("button");

    inputs.forEach(input => {
        input.disabled = !isEditing;
    });

    toggleButton.textContent = isEditing ? "Lưu" : "Sửa";
}


document.querySelectorAll(".contain").forEach(container => {
    const toggleButton = container.querySelector("button");
    toggleButton.addEventListener("click", () => toggleEdit(container));
});

document.querySelectorAll(".inp, .inplocate").forEach(input => {
    input.disabled = true;
});