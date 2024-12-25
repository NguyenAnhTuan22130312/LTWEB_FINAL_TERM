
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
