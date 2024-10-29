function signIN(event){
    event.preventDefault();
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    var user = {
        username :username,
        email : email,
        password : password,
    };
    var json =JSON.stringify(user);
    localStorage.setItem(username,json);
    alert("dang nhap thanh cong");
}

function login(event){
    event.preventDefault();
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    var user = localStorage.getItem(username);
    var data = JSON.parse(user);

    if(user == null){
        alert("Vui lòng đăng nhập");
    }else if(username == data.user && email == data.email && password == data.password){
        window.location.href = "home.html"
    }else{
        alert("Đăng nhập thất bại");
    }
}