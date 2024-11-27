function showContent(sectionId) {
    const sections = document.querySelectorAll(".content-section");
    sections.forEach((section) => section.classList.add("hidden"));
    document.getElementById(sectionId).classList.remove("hidden");
  }
document.getElementById("edit-save-btn").addEventListener("click", function (e) {
    e.preventDefault(); 
  
    const inputs = document.querySelectorAll("input:not([type='radio'])");
    const button = document.getElementById("edit-save-btn"); 
    if (button.textContent === "Sửa") {
      inputs.forEach((input) => input.removeAttribute("disabled"));
      button.textContent = "Lưu"; 
    } else {

      inputs.forEach((input) => input.setAttribute("disabled", "true"));
      button.textContent = "Sửa";
      saveProfile(); 
    }
  });
  
  document.getElementById("edit-save-textarea-btn").addEventListener("click", function (e) {
    e.preventDefault(); 
  
    const textarea = document.getElementById("inplocate"); 
    const button = document.getElementById("edit-save-textarea-btn"); 
  
    if (button.textContent === "Sửa") {
      textarea.removeAttribute("disabled");
      button.textContent = "Lưu"; 
    } else {
      textarea.setAttribute("disabled", "true");
      button.textContent = "Sửa";
      saveTextarea(); 
    }
  });
  
  function saveProfile() {
    const userProfile = {
      username: document.getElementById("username").value,
      name: document.getElementById("name").value,
      email: document.getElementById("email").value,
      phone: document.getElementById("phone").value,
      birthdate: document.getElementById("birthdate").value,
    };
  
    localStorage.setItem("userProfile", JSON.stringify(userProfile));
    alert("Thông tin đã được lưu!");
  }
  
  function saveTextarea() {
    const userAddress = document.getElementById("inplocate").value;

    localStorage.setItem("userAddress", userAddress);
    alert("Địa chỉ đã được lưu!");
  }
  

  window.onload = function () {
    const userProfile = JSON.parse(localStorage.getItem("userProfile"));
    if (userProfile) {
      document.getElementById("username").value = userProfile.username;
      document.getElementById("name").value = userProfile.name;
      document.getElementById("email").value = userProfile.email;
      document.getElementById("phone").value = userProfile.phone;
      document.getElementById("birthdate").value = userProfile.birthdate;
    }
  
    const userAddress = localStorage.getItem("userAddress");
    if (userAddress) {
      document.getElementById("inplocate").value = userAddress;
    }
  };
  