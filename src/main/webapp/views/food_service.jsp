<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Service</title>
  <link href='../Images/LOGO_V2.png' rel='icon' type='image/x-icon' />
  <link rel="stylesheet" href="css/food_service.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>

<body>
  <div class="container">
    <div class="sidebar">
      <img alt="admin" src="../Images/LOGO_V2.png" />
      <h2>T^3 Restaurant</h2>
      <ul>
        <li>
          <a class="active" href="../html/admin.html">
            <i class="fas fa-home"> </i>
            Trang tổng quan
          </a>
        </li>
        <li>
          <a href="../html/food_service.html">
            <i class="fas fa-utensils"> </i>
            Sản phẩm
          </a>
        </li>
          <li>
              <a href="../html/banner.html">
                  <i class="fas fa-image">
                  </i>
                  Quản lý Banner
              </a>
          </li>
        <li>
          <a href="../html/customer_sevice.html">
            <i class="fas fa-users"> </i>
            Khách hàng
          </a>
        </li>
        <li>
          <a href="../html/order.html">
            <i class="fas fa-shopping-cart"> </i>
            Đơn hàng
          </a>
        </li>
        <li>
          <a href="../html/statistical.html">
            <i class="fas fa-chart-bar"> </i>
            Thống kê
          </a>
        </li>

        <li>
          <a href="../html/discount.html">
            <i class="fas fa-chart-bar"> </i>
            Quản lý mã giảm giá
          </a>
        </li>

        <li>
          <a id="logout" href="../html/newhome.html">
            <i class="fas fa-sign-out-alt"> </i>
            Đăng xuất
          </a>
          
        </li>
      </ul>
    </div>


    <div class="content">
      <div class="header">
        <select id="menu_filter">
          <option value="all">
            Tất cả
          </option>
          <option value="mon_com">
            Món cơm
          </option>
          <option value="mon_bun">
            Món bún
          </option>
          <option value="mon_pho">
            Món phở
          </option>
          <option value="thuc_uong">
            Thức uống
          </option>
        </select>
        <input placeholder="Tìm kiếm tên món..." type="text" />

        <button class="add_item_btn">
          + Thêm món mới
        </button>


      </div>

      <div id="popup" class="popup hidden">
        <div class="popup_content">
          <span class="close_btn">
            <i class="fa-solid fa-xmark"></i> 
          </span>
            <h2>THÊM MÓN MỚI</h2>
            <form id="new_item_form">
              <label for="item_name">Tên Món:</label>
              <input type="text" id="item_name" placeholder="Nhập tên món ăn..." required>

              <label for="item_category">Loại Món:</label>
              <select id="item_category">
                <option value="1">Món cơm</option>
                <option value="2">Món phở</option>
                <option value="3">Món bún</option>
                <option value="4">Món nước</option>
              </select>

              <label for="item_price"> Giá:</label>
              <input type="text" id="item_price" placeholder="Nhập giá của món ăn:" required>
              
              <label for="item_details">Chi tiết món ăn:</label>
              <input type="text" id="item_details" placeholder="Nhập chi tiết món ăn:" required>

              <label for="item_image">Hình ảnh:</label>
              <input type="file" id="item_image">

              <button type="submit">Lưu</button>
            </form>
        </div>
      </div>



      <div class="menu_container">

        <div class="menu-item" >
          <img alt="" height="100" src="../Images/Food/Com/Com-ba-roi-rim-tom.png" />
          <div class="details">
            <h3>
              Cơm ba rọi rim tôm
            </h3>
            <p>
              Cơm ba rọi rim tôm là một món ăn đậm đà hương vị, kết hợp giữa thịt ba rọi heo mềm mịn và tôm tươi ngọt, tạo nên sự hòa quyện hoàn hảo.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item" >
          <img alt="A plate of stir-fried mixed vegetables" height="100"
            src="../Images/Food/Com/Com-ca-chien-xa-ot.png" />
          <div class="details">
            <h3>
              Cơm cá chiên xả ớt
            </h3>

            <p>
              Cá chiên xả ớt là món ăn mang đậm hương vị đặc trưng của ẩm thực Việt Nam, 
              với sự kết hợp hài hòa giữa vị ngọt tự nhiên của cá và hương thơm đặc trưng từ sả và ớt.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        <div class="menu-item">
          <img alt="A plate of lava cheese bread" height="100" src="../Images/Food/Com/Com-canh-chua-ca-hu.png" />
          <div class="details">
            <h3>
              Cơm canh chua cá hú
            </h3>
            <p>
              Cơm canh chua cá hú là một món ăn đậm đà và thanh mát, mang đặc trưng của ẩm thực miền Nam Việt Nam. 
              Món canh chua cá hú được nấu từ những miếng cá hú tươi ngon, thịt cá mềm, ngọt, kết hợp với vị chua nhẹ từ me và các loại rau thơm
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        <div class="menu-item">
          <img alt="A set of Thai Tomyum hotpot ingredients" height="100"
            src="../Images/Food/Com/Com-chien-bo-luc-lac.png" />
          <div class="details">
            <h3>
              Cơn chiên bò lúc lắc
            </h3>
            <p>
              Cơm chiên bò lúc lắc là món ăn nổi bật với những miếng thịt bò mềm, thấm đẫm gia vị, kết hợp với cơm chiên vàng ươm và rau củ giòn ngọt.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-chien-dua-bo.png" />
          <div class="details">
            <h3>
              Cơm chiên dưa bò
            </h3>
            <p>
              Cơm chiên dưa bò là một món ăn kết hợp hoàn hảo giữa vị béo ngậy của cơm chiên, sự tươi mát của dưa chua và vị ngọt mềm của thịt bò.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-chien-duong-chau.png" />
          <div class="details">
            <h3>
              Cơm chiên dương châu
            </h3>
            <p>
              Cơm chiên dương châu là món ăn đặc trưng của ẩm thực Trung Hoa, với cơm chiên thơm lừng kết hợp với thịt gà, tôm, trứng và rau củ tươi ngon. 
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-chien-ga-xoi-mo.png" />
          <div class="details">
            <h3>
              Cơm chiên gà xối mỡ
            </h3>
            <p>
              Cơm gà xối mỡ là món ăn truyền thống với thịt gà được chiên giòn rụm, kết hợp cùng cơm trắng dẻo thơm và các loại rau sống tươi mát.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>



        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-chien-muc-trung-muoi.png" />
          <div class="details">
            <h3>
              Cơm mực trứng muối
            </h3>
            <p>
              Cơm mực trứng muối là món ăn thơm ngon với mực tươi, trứng muối béo ngậy, hòa quyện cùng cơm chiên mềm và gia vị đậm đà.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>



        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-chien-trung-op-la.png" />
          <div class="details">
            <h3>
              Cơm chiên trứng ốp la
            </h3>
            <p>
              Cơm chiên trứng ốp la là món ăn đơn giản nhưng cực kỳ ngon miệng, 
              với cơm chiên thơm dẻo và một quả trứng ốp la vàng ươm, ăn kèm với thịt, rau củ và gia vị.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-dau-hu-kho-ca-ri.png" />
          <div class="details">
            <h3>
              Cơm đậu hủ kho cà ri
            </h3>
            <p>
              Cơm đậu hũ kho cà ri là món ăn vừa ngon lại vừa dễ ăn với đậu hũ mềm được kho thấm gia vị cà ri đặc trưng.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-dau-hu-kho-suon-chay.png" />
          <div class="details">
            <h3>
              Cơm đậu hủ kho sườn cay
            </h3>

            <p>
              Cơm đậu hũ kho sườn chay là một món ăn thanh đạm, phù hợp cho những ai muốn thưởng thức ẩm thực chay.
              Đậu hũ mềm mịn kết hợp với sườn chay kho đậm đà tạo nên một món ăn đầy đủ dinh dưỡng và dễ ăn.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-ga-kho-xa-ot.png" />
          <div class="details">
            <h3>
              Cơm gà kho xả ớt
            </h3>
            <p>
              Cơm gà kho sả ớt là món ăn đậm đà hương vị với thịt gà thơm ngon, thấm đẫm gia vị sả và ớt cay nồng. 
              Vị ngọt tự nhiên của gà kết hợp cùng hương thơm của sả và vị cay nhẹ của ớt tạo nên món ăn hấp dẫn.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-ga-nau-Hai-Nam.png" />
          <div class="details">
            <h3>
              Cơm gà nấu Hải Nam
            </h3>
            <p>
              Cơm gà nấu Hải Nam có nguồn gốc từ Trung Quốc, với thịt gà được nấu mềm mịn và cơm thơm lừng.
               Cơm được nấu với nước dùng gà, tạo nên hương vị đặc trưng và dễ gây nghiện.
            </p>

            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
    
        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-gio-heo-kho-cai-chua.png" />
          <div class="details">
            <h3>
              Cơm giò heo khô cải chua
            </h3>
            <p>
              Món cơm giò heo kho cải chua là sự kết hợp hoàn hảo giữa giò heo kho mềm ngon, đậm đà gia vị, ăn kèm với cải chua làm món ăn thêm phần hấp dẫn.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-kho-qua-cha-ca.png" />
          <div class="details">
            <h3>
              Cơm khổ qua chả cá
            </h3>
            <p>
              Món cơm khổ qua chả cá độc đáo với chả cá thơm ngon và khổ qua tươi xanh. 
              Vị đắng nhẹ của khổ qua hòa quyện cùng chả cá mềm ngọt tạo nên sự cân bằng hoàn hảo.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-muc-xao.png" />
          <div class="details">
            <h3>
              Cơm mực xào
            </h3>
            <p>
              Cơm mực xào là món ăn ngon với mực tươi xào cùng gia vị đậm đà, tạo ra sự kết hợp hoàn hảo với cơm trắng. 
              Món ăn này không chỉ ngon mà còn rất bổ dưỡng, mang lại hương vị mới mẻ cho bữa ăn.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-suon-cong-mat-ong.png" />
          <div class="details">
            <h3>
              Cơm sườn cọng mật ong
            </h3>
            <p>
              Cơm sườn cọng mật ong nổi bật với hương vị ngọt ngào của mật ong thấm vào từng miếng sườn nướng.
               Sườn được chế biến mềm, không khô, và có lớp ngoài giòn nhẹ.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-suon-non-rim-nuoc-dua.png" />
          <div class="details">
            <h3>
              Cơm sườn non rim nước dừa
            </h3>
            <p>
              Cơm sườn non rim nước dừa mang đến hương vị đậm đà và béo ngậy của nước dừa. 
              Miếng sườn được nấu mềm, ngấm vị ngọt của dừa và nước mắm, tạo nên một món ăn hấp dẫn, ngon miệng.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-dui-ga-chien.png" />
          <div class="details">
            <h3>
              Cơm tấm đùi gà chiên
            </h3>
            <p>
              Cơm tấm đùi gà chiên là món ăn phổ biến với đùi gà giòn rụm, cơm tấm mềm dẻo và chén nước mắm pha đặc trưng.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-heo-quay.png" />
          <div class="details">
            <h3>
              Cơm tấm heo quay
            </h3>
            <p>
              Cơm tấm heo quay là một món ăn đặc trưng của ẩm thực miền Nam, nổi bật với hương vị đậm đà, dễ ăn và rất được ưa chuộng.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-suon-bi-cha.png" />
          <div class="details">
            <h3>
              Cơm tấm sườn bì chả
            </h3>
            <p>
              Cơm tấm sườn bì chả là món ăn đặc trưng của ẩm thực miền Nam. 
              Sườn nướng thơm ngon, bì giòn và chả lụa béo ngậy được kết hợp với cơm tấm dẻo, tạo nên một món ăn ngon
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-suon-trung.png" />
          <div class="details">
            <h3>
              Cơm tấm sườn trứng
            </h3>
            <p>
              Cơm tấm sườn trứng là món ăn phổ biến với sự kết hợp giữa sườn nướng thơm lừng, 
              trứng ốp la mềm và cơm tấm dẻo. Món ăn này không chỉ ngon miệng mà còn rất dễ ăn
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-thit-nuong.png" />
          <div class="details">
            <h3>
              Cơm tấm thịt nướng
            </h3>
            <p>
              Cơm tấm thịt nướng là món ăn đậm đà hương vị, với thịt nướng vàng ươm, mềm, 
              thấm đẫm gia vị. Khi ăn kèm với cơm tấm dẻo và nước mắm pha, món ăn này mang lại cảm giác thỏa mãn
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-tam-xiu-mai.png" />
          <div class="details">
            <h3>
              Cơm tấm xíu mại
            </h3>
            <p>
              Cơm tấm thịt nướng là món ăn đậm đà hương vị, với thịt nướng vàng ươm, mềm, thấm đẫm gia vị. 
              Khi ăn kèm với cơm tấm dẻo và nước mắm pha, món ăn này mang lại cảm giác thỏa mãn
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-thit-kho-Dai-Loan.png" />
          <div class="details">
            <h3>
              Cơm tấm thịt kho Đài Loan
            </h3>
            <p>
              Cơm tấm thịt kho Đài Loan với thịt kho mềm, thấm đẫm gia vị, nước kho đậm đà, ăn kèm với cơm tấm dẻo, tạo nên một món ăn rất đặc biệt.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-thit-kho-mam-ruoc.png" />
          <div class="details">
            <h3>
              Cơm thịt kho mắm ruốc
            </h3>
            <p>
              Cơm thịt kho mắm ruốc có hương vị đặc trưng của mắm ruốc kết hợp với thịt kho mềm, nước kho đậm đà. 
              Món ăn này mang lại cảm giác thỏa mãn, vừa cay cay vừa mặn mà, ăn kèm với cơm tấm là một sự kết hợp tuyệt vời
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-thit-kho-tieu.png" />
          <div class="details">
            <h3>
              Cơm thịt kho tiêu
            </h3>
            <p>
              Cơm thịt kho tiêu là món ăn quen thuộc với hương vị đặc trưng của thịt heo kho đậm đà, kết hợp với tiêu đen thơm nồng. 
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>



        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-thit-kho-trung.png" />
          <div class="details">
            <h3>
              Cơm thịt kho trứng
            </h3>
            <p>
              Cơm thịt kho trứng là món ăn quen thuộc với sự kết hợp giữa thịt kho mềm ngọt và trứng kho thơm, đậm đà.
               Nước kho từ thịt và trứng tạo thành một món ăn tuyệt vời khi ăn cùng cơm.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-thit-luoc-ca-phao.png" />
          <div class="details">
            <h3>
              Cơm thịt luộc cà pháo
            </h3>
            <p>
              Cơm thịt luộc cà pháo là món ăn dân dã nhưng rất ngon miệng, với thịt luộc tươi ngon ăn kèm với cà pháo muối chua, tạo nên hương vị đậm đà, dễ ăn
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Com/Com-trung-cuon-thit.png" />
          <div class="details">
            <h3>
              Cơm trứng cuộn thịt
            </h3>
            <p>
              Cơm trứng cuộn thịt là món ăn đơn giản nhưng đầy đủ dinh dưỡng, với trứng cuộn mềm mại, bên trong là thịt xay thơm ngon.
            </p>
            <button>
              Món cơm
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <!-- Xử lý món bún -->

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-Bo-Hue.png" />
          <div class="details">
            <h3>
              Bún bò Huế
            </h3>
            <p>
              Bún bò Huế là một món ăn đặc trưng của miền Trung, nổi bật với hương vị đậm đà, cay nồng. 
              Sợi bún mềm mại được kết hợp với nước dùng hầm từ xương bò và các loại gia vị
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>



        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-cha-ghe.png" />
          <div class="details">
            <h3>
              Bún chả ghẹ
            </h3>
            <p>

              Bún chả ghẹ là một món ăn đặc biệt kết hợp giữa chả ghẹ tươi ngon và sợi bún mềm mại. 
              Chả ghẹ được chế biến từ thịt ghẹ tươi, giòn ngọt và đậm đà gia vị
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-cha-ha-noi.png" />
          <div class="details">
            <h3>
              Bún chả Hà Nội
            </h3>
            <p>
              Bún chả Hà Nội là món ăn nổi tiếng với sự kết hợp hoàn hảo giữa bún tươi và chả nướng thơm lừng.
               Chả được làm từ thịt heo xay nhuyễn, nêm gia vị rồi nướng trên than hồng, mang lại hương vị đặc trưng
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-ga-sa-te.png" />
          <div class="details">
            <h3>
              Bún gà sa tế
            </h3>
            <p>
              Bún gà sa tế là món ăn đậm đà và cay nồng, đặc trưng với hương vị sa tế thơm lừng.
               Thịt gà được nấu mềm, ngấm gia vị cay nồng của sa tế, hòa quyện với sợi bún mềm mại.
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-heo-quay-cha-gio-top-mo.png" />
          <div class="details">
            <h3>
              Bún heo quay chả giò
            </h3>
            <p>
              Bún heo quay tóp mỡ là sự kết hợp tuyệt vời giữa các món ăn yêu thích của người Việt. 
              Heo quay vàng giòn, thấm đẫm gia vị được ăn kèm với chả giò giòn rụm và tóp mỡ béo ngậy
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-Hue-chay.png" />
          <div class="details">
            <h3>
              Bún Huế chay
            </h3>
            <p>
              Bún Huế chay là món ăn thuần Việt mang đậm hương vị miền Trung, nhưng không sử dụng thịt mà thay vào đó là những nguyên liệu chay thanh đạm
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-mang-ga.png" />
          <div class="details">
            <h3>
              Bún măng gà
            </h3>
            <p>
              Món bún măng gà hấp dẫn với thịt gà mềm, măng tươi giòn, hòa quyện trong nước dùng thanh ngọt, đậm đà. 
              Được trang trí với hành phi và rau sống tươi ngon, tạo nên một bữa ăn vừa bổ dưỡng vừa thơm ngon.
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-nem-thit-nuong.png" />
          <div class="details">
            <h3>
              Bún nem thịt nướng
            </h3>
            <p>
              Bún nem thịt nướng là sự kết hợp hoàn hảo giữa nem nướng thơm lừng và thịt heo nướng xém vàng, chín mềm.
               Món ăn được ăn kèm với bún tươi, rau sống và nước mắm chua ngọt, mang đến hương vị đậm đà khó quên.
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        
        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-thit-luoc-rau-song-mam-nem.png" />
          <div class="details">
            <h3>
              Bún thịt luộc nắm nêm
            </h3>
            <p>
              Bún thịt luộc mắm nêm là món ăn dân dã với thịt heo luộc thái mỏng, ăn kèm rau sống tươi ngon và mắm nêm đậm đà. 
              Món ăn này mang lại sự hòa quyện giữa vị ngọt của thịt, vị mặn của mắm nêm và độ tươi mát của rau sống.
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        
        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Bun/Bun-thit-nuong.png" />
          <div class="details">
            <h3>
              Bún thịt nướng
            </h3>
            <p>
              Bún thịt nướng là món ăn quen thuộc với thịt heo nướng thơm ngon, giòn rụm, kết hợp với bún tươi, rau sống và đậu phộng rang. 
              Đặc biệt, nước mắm pha chua ngọt sẽ làm tăng thêm vị đậm đà cho món ăn, mang đến trải nghiệm ẩm
    
            </p>
            <button>
              Món bún
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <!-- Xử lý phở -->

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-bo-chin.png" />
          <div class="details">
            <h3>
              Phở bò chín
            </h3>
            <p>
              Phở bò chín là món ăn phổ biến với thịt bò được ninh mềm, tạo ra hương vị đậm đà kết hợp cùng nước dùng thanh, ngọt từ xương bò. 
              Món ăn thường được ăn kèm với bánh phở mềm, hành lá, rau thơm và thêm chút chanh, ớt để tăng hương vị.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-bo-tai-lan.png" />
          <div class="details">
            <h3>
              Phở bò tái lăn
            </h3>
            <p>
              Phở bò tái lăn khác biệt nhờ thịt bò được xào nhanh qua lửa trước khi cho vào nước dùng. 
              Cách chế biến này tạo nên độ mềm mại nhưng vẫn giữ được vị ngọt tự nhiên của thịt bò.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-bo-tai.png" />
          <div class="details">
            <h3>
              Phở bò tái 
            </h3>
            <p>
              Phở bò tái là món phở được yêu thích nhờ sự hòa quyện của thịt bò tươi tái và nước dùng thanh, ngọt từ xương bò. 
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-bo-vien.png" />
          <div class="details">
            <h3>
              Phở bò viên
            </h3>
            <p>
              Phở bò viên là sự kết hợp giữa nước dùng đậm đà, thanh ngọt và những viên bò được làm từ thịt bò xay nhuyễn, gia vị, tạo độ dai, giòn đặc trưng.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-chua-lang-son.png" />
          <div class="details">
            <h3>
              Phở chua lạng sơn
            </h3>
            <p>
              Phở chua Lạng Sơn là món ăn đặc trưng của vùng núi phía Bắc với vị chua thanh nhẹ, 
              hòa quyện cùng bánh phở mềm và các nguyên liệu như thịt gà xé, thịt lợn quay giòn, lạc rang, và rau thơm. 
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-cuon-chay.png" />
          <div class="details">
            <h3>
              Phở cuốn chay
            </h3>
            <p>
              Phở cuốn chay là sự lựa chọn nhẹ nhàng cho người yêu thích món chay. 
              Bánh phở mềm, cuộn chặt với các loại rau củ tươi như xà lách, cà rốt, bún, đậu phụ và gia vị.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-cuon-chien-phong.png" />
          <div class="details">
            <h3>
              Phở cuốn chiên phồng
            </h3>
            <p>
              Phở cuốn chiên phồng mang hương vị lạ miệng khi bánh phở được cuốn chặt và chiên vàng giòn bên ngoài, giữ lại nhân thịt hoặc tôm, rau củ bên trong.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-cuon-ngu-xa.png" />
          <div class="details">
            <h3>
              Phở cuốn ngũ xã
            </h3>
            <p>
              Phở cuốn Ngũ Xá nổi tiếng với những lát bánh phở mềm, cuốn chặt thịt bò xào thơm ngon cùng rau sống. 
              Điểm nhấn là phần thịt bò được xào chín vừa, mềm, thơm mà không bị dai
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-cuon-thit-heo.png" />
          <div class="details">
            <h3>
              Phở cuốn thịt heo
            </h3>
            <p>
              Phở cuốn thịt heo là sự kết hợp giữa bánh phở mềm và thịt heo luộc hoặc nướng, tạo nên hương vị thơm ngon, dễ ăn.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-cuon-tom-chua.png" />
          <div class="details">
            <h3>
              Phở cuộn tôm chua
            </h3>
            <p>
              Phở cuốn tôm chua mang đậm hương vị đặc trưng của miền Trung với tôm chua, bánh phở mềm mịn và các loại rau sống.
               Nhân cuốn có vị chua nhẹ của tôm lên men, cùng rau thơm, xà lách, tạo nên món ăn lạ miệng, hấp dẫn
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-ga.png" />
          <div class="details">
            <h3>
              Phở gà
            </h3>
            <p>
              Phở gà là món ăn truyền thống với nước dùng trong, ngọt thanh được ninh từ xương gà, kết hợp cùng thịt gà thơm, mềm. 
              Món ăn có bánh phở mềm, hành lá, rau mùi và chanh, ớt tạo nên hương vị tươi mát, nhẹ nhàng.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-hai-san.png" />
          <div class="details">
            <h3>
              Phở hải sản
            </h3>
            <p>
              Phở hải sản là sự kết hợp độc đáo giữa nước dùng thơm ngọt từ hải sản như tôm, mực và cua. Bánh phở mềm, ăn kèm các loại hải sản tươi ngon, 
              hành lá, rau mùi, cùng chút chanh ớt tạo nên món phở đầy đủ vị ngọt của biển.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-heo.png" />
          <div class="details">
            <h3>
              Phở thịt heo
            </h3>
            <p>
              Phở heo là biến tấu từ phở truyền thống với nước dùng được ninh từ xương heo, tạo độ ngọt thanh tự nhiên.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-xao-gion.png" />
          <div class="details">
            <h3>
              Phở xào giòn
            </h3>
            <p>
              Phở xào giòn là món ăn với bánh phở được chiên giòn rụm, kết hợp cùng thịt bò, hải sản hoặc rau củ xào. 
              Nước sốt sệt đậm đà chan lên lớp phở giòn tan, tạo nên sự cân bằng giữa độ giòn và độ mềm trong từng miếng ăn.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-xao-hai-san.png" />
          <div class="details">
            <h3>
              Phở xào hải sản
            </h3>
            <p>
              Phở xào hải sản là món ăn được yêu thích nhờ sự kết hợp giữa bánh phở dai, mềm và các loại hải sản tươi ngon như tôm, mực, và cá. 
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-xao-kieu-Thai.png" />
          <div class="details">
            <h3>
              Phở xài kiểu Thái
            </h3>
            <p>
              Phở xào kiểu Thái mang nét đặc trưng với hương vị đậm đà,
               chua cay nhờ nước sốt được pha từ gia vị truyền thống Thái như nước mắm, ớt, nước cốt chanh và thảo mộc.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-xao-rau-cai.png" />
          <div class="details">
            <h3>
              Phở xào rau cải
            </h3>
            <p>
              Phở xào rau cải là món ăn đơn giản nhưng không kém phần hấp dẫn với bánh phở xào cùng rau cải xanh tươi. 
              Rau cải được xào nhanh tay giữ độ giòn và màu sắc xanh mướt, kết hợp cùng bánh phở dai mềm, gia vị đậm đà.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/Pho-xot-vang.png" />
          <div class="details">
            <h3>
              Phở xốt vang
            </h3>
            <p>
              Phở xốt vang là món ăn độc đáo kết hợp giữa phở truyền thống và thịt bò hầm xốt vang, một kiểu hầm bò mang hương vị phương Tây. 
              Thịt bò mềm, thấm gia vị, hòa quyện với nước dùng xốt vang đậm đà, thơm lừng vị rượu vang và các loại thảo mộc.
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/pho-ga-tron.png" />
          <div class="details">
            <h3>
              Phở gà trộn
            </h3>
            <p>
              Phở gà trộn là món ăn hấp dẫn với bánh phở mềm trộn cùng thịt gà xé dai ngon, thường được thêm hành phi, lạc rang, rau thơm và các loại gia vị. 
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        
        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/Pho/pho-xao-thit-bam.png" />
          <div class="details">
            <h3>
              Phở xào thịt bằm
            </h3>
            <p>
              Phở xào thịt băm là sự kết hợp hài hòa giữa bánh phở dai mềm và thịt băm nhỏ, được xào cùng gia vị thơm phức. Món này thường được thêm hành lá, 
              rau mùi và các loại gia vị đặc trưng như nước tương, tiêu, ớt, tạo nên hương vị đậm đà, dễ ăn
            </p>
            <button>
              Món phở
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <!-- Xử lý món nước -->

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/chanh-muoi.png" />
          <div class="details">
            <h3>
              Chanh muối
            </h3>
            <p>
              Chanh muối là thức uống giải khát truyền thống với vị chua ngọt và chút mặn nhẹ, giúp thanh lọc cơ thể và giải nhiệt nhanh chóng. 
              Đồ uống này còn mang đến cảm giác sảng khoái, giúp giảm mệt mỏi.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/espresso.png" />
          <div class="details">
            <h3>
              Expresso
            </h3>
            <p>
              Espresso là loại cà phê đậm đà, được pha chế từ máy với áp suất cao, tạo nên lớp bọt mịn trên bề mặt. 
              Đây là thức uống yêu thích cho những ai cần sự tỉnh táo và thích hương vị mạnh mẽ của cà phê nguyên chất.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/latte.png" />
          <div class="details">
            <h3>
              Latte
            </h3>
            <p>
              Latte là sự kết hợp hài hòa giữa cà phê espresso và sữa tươi được đánh nóng, tạo nên lớp bọt sữa mềm mịn, 
              thơm béo. Đây là thức uống lý tưởng cho những ai yêu thích cà phê với vị nhẹ nhàng, êm dịu.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/matcha-latte.png" />
          <div class="details">
            <h3>
              Matcha Latte
            </h3>
            <p>
              Matcha Latte là sự kết hợp giữa bột trà xanh nguyên chất và sữa tươi, tạo nên vị ngọt nhẹ, thơm mát và hơi đắng đặc trưng của matcha. 
              Món này không chỉ thơm ngon mà còn giàu chất chống oxy hóa, tốt cho sức khỏe.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Nuoc-cam.png" />
          <div class="details">
            <h3>
              Nước cam
            </h3>
            <p>
              Nước cam tươi ép là thức uống bổ dưỡng, giàu vitamin C, giúp tăng cường miễn dịch và cung cấp năng lượng tức thì. 
              Hương vị cam ngọt mát, thơm ngon, là lựa chọn hoàn hảo cho những ngày hè oi bức hoặc khi bạn cần sự tươi mới.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>
        
        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Nuoc-chanh.png" />
          <div class="details">
            <h3>
              Nước chanh
            </h3>
            <p>
              Nước chanh tươi mát là thức uống quen thuộc giúp giải khát hiệu quả, 
              thanh lọc cơ thể và tăng cường sức đề kháng nhờ lượng vitamin C dồi dào. Đồ uống này mang vị chua ngọt nhẹ, dễ uống và sảng khoái.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Nuoc-dua-hau.png" />
          <div class="details">
            <h3>
              Nước dưa hấu
            </h3>
            <p>
              Nước dưa hấu tươi mát mang lại cảm giác sảng khoái tức thì nhờ vị ngọt tự nhiên và giàu nước. 
              Đây là thức uống lý tưởng để giải nhiệt trong những ngày nắng nóng, bổ sung vitamin và khoáng chất cần thiết.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Nuoc-ep-buoi-ca-rot.png" />
          <div class="details">
            <h3>
              Nước ép bưởi cà rốt
            </h3>
            <p>
              Nước ép bưởi cà rốt kết hợp hai thành phần giàu vitamin C và beta-carotene, giúp tăng cường sức khỏe và đẹp da. 
              Vị ngọt dịu từ cà rốt hòa quyện với chút chua nhẹ của bưởi, mang lại hương vị tươi ngon, bổ dưỡng.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/nuoc-ep-dua-cam.png" />
          <div class="details">
            <h3>
              Nước ép dứa cam
            </h3>
            <p>
              Nước ép dứa cam kết hợp vị ngọt đậm đà của dứa với vị chua thanh của cam, 
              tạo nên thức uống vừa ngon miệng vừa giàu vitamin. Đồ uống này giúp tăng cường sức đề kháng và hỗ trợ tiêu hóa hiệu quả.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Nuoc-ep-tao.png" />
          <div class="details">
            <h3>
              Nước ép táo
            </h3>
            <p>
              Nước ép táo tươi mát với hương vị ngọt thanh nhẹ nhàng, giúp cung cấp năng lượng và bổ sung vitamin A, C. 
              Thức uống này mang lại sự tươi mới và lành mạnh, thích hợp cho mọi lứa tuổi.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/sinh-to-dau-sua-chua.png" />
          <div class="details">
            <h3>
              Sinh tố dâu sữa chua
            </h3>
            <p>
              Sinh tố dâu tươi kết hợp sữa chua mịn màng, tạo nên thức uống chua ngọt độc đáo, 
              giàu vitamin C và tốt cho hệ tiêu hóa. Phù hợp với những ai yêu thích hương vị trái cây tự nhiên.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Sinh-to-xoai.png" />
          <div class="details">
            <h3>
              Sinh tố xoài
            </h3>
            <p>
              Sinh tố xoài đậm đà, thơm lừng vị xoài chín, giàu chất xơ và vitamin C, mang lại cảm giác sảng khoái và giải nhiệt cho cơ thể trong những ngày nắng nóng.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Sua-chua-viet-quat.png" />
          <div class="details">
            <h3>
              Sữa chua việt quất
            </h3>
            <p>
              Sữa chua việt quất với vị chua ngọt tự nhiên, bổ sung lợi khuẩn và chất chống oxy hóa từ việt quất, mang đến thức uống tốt cho sức khỏe và làn da.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-bac-ha.png" />
          <div class="details">
            <h3>
              Trà bạc hà
            </h3>
            <p>
              Trà bạc hà thơm mát, giúp thư giãn và giảm căng thẳng. Vị mát lạnh từ bạc hà làm dịu đi sự oi bức của ngày hè, đồng thời hỗ trợ tiêu hóa hiệu quả.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-dao.png" />
          <div class="details">
            <h3>
              Trà đào
            </h3>
            <p>
              Trà đào ngọt ngào, kết hợp vị chua nhẹ của đào chín mọng, mang đến hương vị tươi mát và sảng khoái. Thích hợp cho những ai yêu thích vị trà trái cây tự nhiên.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-sua-cookie.png" />
          <div class="details">
            <h3>
             Trà sữa cookie
            </h3>
            <p>
              Trà sữa cookie là sự hòa quyện giữa vị trà sữa thơm béo và hương vị giòn tan của cookie. Một thức uống ngọt ngào và thú vị dành cho các bạn trẻ.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-hoa-nhai.png" />
          <div class="details">
            <h3>
              Trà hoa nhài
            </h3>
            <p>
              Trà hoa nhài dịu nhẹ, mang hương thơm thanh khiết giúp thư giãn và làm dịu tinh thần. Thức uống thanh mát này là lựa chọn lý tưởng cho những buổi tối thư thái.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-sua-kem-trung-chay.png" />
          <div class="details">
            <h3>
              Trà sữa kem trứng chảy
            </h3>
            <p>
              Trà sữa kem trứng cháy độc đáo với lớp kem trứng béo ngậy và vị trà thơm đậm đà. 
              Sự kết hợp tuyệt vời này mang lại trải nghiệm mới mẻ và hấp dẫn cho người thưởng thức.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>


        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra-tran-chau-khoai-lang.png" />
          <div class="details">
            <h3>
              Trà chân châu khoai lang
            </h3>
            <p>
              Trà trân châu khoai lang với trân châu dẻo thơm vị khoai lang, hòa quyện với trà thanh mát. 
              Đây là món uống đặc biệt, hấp dẫn và phù hợp cho mọi lứa tuổi.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>

        <div class="menu-item">
          <img alt="" height="100" src="../Images/Food/nuoc/Tra_chanh_gia_tay.png" />
          <div class="details">
            <h3>
              Trà chanh giã tay
            </h3>
            <p>
              Trà chanh gài Tây có hương vị chua thanh của chanh kết hợp với vị trà đậm đà, 
              giúp thanh lọc cơ thể và giải khát hiệu quả. Thức uống này rất thích hợp trong ngày hè.
            </p>
            <button>
              Đồ nước
            </button>
          </div>
          <div class="price">
            30.000đ
          </div>
          <div class="actions">
            <button>
              <i class="fas fa-edit">
              </i>
            </button>
            <button>
              <i class="fas fa-trash">
              </i>
            </button>
          </div>
        </div>    

      </div>

      <div class="pagi">
        <a href="#" class="prev"><</a>
        <a href="#" class="page-number active" data-page="1">1</a>
        <a href="#" class="page-number" data-page="2">2</a>
        <a href="#" class="page-number" data-page="3">3</a>
        <a href="#" class="page-number" data-page="4">4</a>
        <a href="#" class="page-number" data-page="5">5</a>
        <a href="#" class="page-number" data-page="6">6</a>
        <a href="#" class="page-number" data-page="7">7</a>
        <a href="#" class="page-number" data-page="8">8</a>
        <a href="#" class="page-number" data-page="9">9</a>
        <a href="#" class="page-number" data-page="10">10</a>
        <a href="#" class="page-number" data-page="11">11</a>
        <a href="#" class="page-number" data-page="12">12</a>
        <a href="#" class="page-number" data-page="13">13</a>
        <a href="#" class="page-number" data-page="14">14</a>
        <a href="#" class="page-number" data-page="15">15</a>
        <a href="#" class="page-number" data-page="16">16</a>
        <a href="#" class="next">></a>
      </div>





    </div>
  </div>
  <script src="js/food_service.js"></script>
  <script src="js/module_dangnhap.js"></script>
</body>

</html>