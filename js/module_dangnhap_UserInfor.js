
function checkLoginStatus() {
    const loggedInUser = JSON.parse(localStorage.getItem("loggedInUser"));

        document.getElementById("login-link").style.display = "none";  
        document.getElementById("user-menu").style.display = "block";    
 
        const userName = document.getElementById("user-name");
        userName.textContent = loggedInUser.username;


        const userLink = document.getElementById("user-link");   
            
            userLink.style.display = "none";     

        const userNameText = document.getElementById("username");
        userNameText.textContent = loggedInUser.password;
}


checkLoginStatus();

window.addEventListener("DOMContentLoaded", () => {
    const userData = JSON.parse(localStorage.getItem("loggedInUser"));
    
    if (userData) {
        document.getElementById("username").value = userData.username;
        document.getElementById("email").value = userData.email;
        document.getElementById("password").value = userData.password;
    }
});
