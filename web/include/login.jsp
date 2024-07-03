<!DOCTYPE html>
<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Vike Online - Shopping</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- UIkit CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />


        <link rel="shortcut icon" href="../image/logo/logoSHop.png" type="image/x-icon">

        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../style/header.css">
        <link rel="stylesheet" href="../style/header-video-trailer.css">
        <!--<link rel="stylesheet" href="style/middle.css">-->
        <link rel="stylesheet" href="../style/middle-poster.css">
        <link rel="stylesheet" href="../style/list-color.css">
        <link rel="stylesheet" href="../style/footer.css">
        <link rel="stylesheet" href="../style/card.css">
        <link rel="stylesheet" href="../style/login.css">
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="head">
            <input type="checkbox" id="check">
            <div class="head-side-1">
                <p>GIAO HÀNG MIỄN PHÍ</p>
                <div class="btn_one">
                    <label for="check">
                        <i class="fa fa-chevron-down"></i>
                    </label>
                </div>
            </div>
            <div class="head-side-2">
                <div class="text">
                    <h2>TRẢ HÀNG DỄ DÀNG</h2>
                    <p class="content">
                        Nếu bạn không hài lòng với đơn hàng của mình, bạn có thể được hoàn lại tiền. Vui lòng xem Chính Sách Trả Hàng của chúng tôi để biết thêm chi tiết.
                    </p>
                    <a href="#" class="link">
                        TRẢ HÀNG DỄ DÀNG
                    </a>
                </div>
                <div class="text">
                    <div class="btn_two">
                        <label for="check">
                            <i class="fa fa-times"></i>
                        </label>
                    </div>
                    <h2>GIAO HÀNG MIỄN PHÍ CHO THÀNH VIÊN CỦA ADICLUB</h2>
                    <p class="content">
                        Đăng ký thành viên adiClub để hưởng thụ dịch vụ giao hàng miễn phí! Hoặc bạn chỉ được nhận ưu đãi miễn phí giao hàng với hóa đơn có trị giá ít nhất 1.6 triệu đồng
                    </p>
                    <a href="#" class="link">
                        THAM GIA NGAY
                    </a>
                </div>
            </div>
        </div>
        <div class="navbar">
            <div class="container">
                <div class="left-section">
                    <a href="index.jsp">
                        <img src="../image/logo/logo_title.png" alt="#">
                    </a>
                </div>
                <div class="middle-section">
                    <nav>
                        <ul>
                            <li><a href="include/nam.jsp">Nam</a></li>
                            <li><a href="include/nu.jsp">Nữ</a></li>
                            <li><a href="include/discount.jsp">Giảm giá</a></li>
                            <li><a href="AllServlet?action=listAll">Tất cả</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="right-section">
                    <div class="container">
                        <div class="search-place">
                            <form id="searchForm" action="SearchServlet" method="get">
                                <input id="searchInput" class="search-bar" type="text" name="query" placeholder="Tìm kiếm">
                                <button type="submit" class="search-button">
                                    <img class="search-icon" src="../icons/search.svg" alt="#">
                                </button>
                            </form>
                        </div>
                        <a href="include/sigin.jsp">
                            <img class="icon-head" src="../icons/user.png" alt="#">
                        </a>
                        <a href="include/wishList.jsp">
                            <img class="icon-head" src="../icons/love-hand-drawn-heart-symbol-outline.png" alt="#">
                        </a>
                        <div class="notification-item">
                            <a href="include/shopBag.jsp">
                                <div class="shopBag-container">
                                    <img class="icon-head" src="../icons/shopping-bag.png" alt="#">
                                </div>
                            </a>
                            <div class="tool-shop">Túi của bạn trống</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrapper">
        <div class="login_box">
            <div class="login-header">
                <span>Login</span>
            </div>
            <form action="LoginServlet" method="get">
                <div class="input_box">
                    <input type="text" id="email" name="Email" class="input-field" required value="${Email}" />
                    <label for="email" class="label">Email</label>
                    <i class="fa-regular fa-user"></i>
                </div>
                <div class="input_box">
                    <input type="password" id="pass" name="Password" class="input-field" required value="${Password}" />
                    <label for="pass" class="label">Password</label>
                    <i class="fa-solid fa-lock"></i>
                </div>
                <div class="remember-forgot">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" />
                        <label for="remember">Remember me</label>
                    </div>
                    <div class="forgot">
                        <a href="#">Forgot password?</a>
                    </div>
                </div>
                <div class="input_box">
                    <input type="submit" class="input-submit" value="Login" />
                </div>
            </form>
            <div class="register">
                <span>
                    Don't have an account?
                    <a href="#">Register</a>
                </span>
            </div>
            <c:if test="${not empty msg}">
                <p>${msg}</p>
            </c:if>
        </div>
    </div>

    <footer>
        <div class="description">
            <div class="text">
                <h1>
                    STORIES, STYLES AND SPORTSWEAR AT ADIDAS, SINCE 1949
                </h1>
                <p>
                    Sport keeps us fit. Keeps you mindful. Brings us together. Through sport we have the power to change lives. Whether it is through stories of inspiring athletes. Helping you to get up and get moving. Sportswear featuring the latest technologies, to up your performance. Beat your PB.adidas offers a home to the runner, the basketball player, the soccer kid, the fitness enthusiast. The weekend hiker that loves to escape the city. The yoga teacher that spreads the moves. The 3-Stripes are seen in the music scene. On stage, at festivals. Our sports clothing keeps you focused before that whistle blows. During the race. And at the finish lines. We’re here to supportcreators. Improve their game. Their lives. And change the world.
                    adidas is about more than sportswear and workout clothes. We partner with the best in the industry to co-create. This way we offer our fans the sports apparel and style that match their athletic needs, while keeping sustainability in mind. We’re here to support creators. Improve their game. Create change. And we think about the impact we have on our world.
                </p>
            </div>
            <div class="text">
                <h1>
                    Workout clothes, for any sport
                </h1>
                <p>
                    adidas designs for and with athletes of all kinds. Creators, who love to change the game. Challenge conventions. Break the rules and define new ones. Then break them again. We supply teams and individuals with athletic clothing pre-match. To stay focused. We design sports apparel that get you to the finish line. To win the match. We support women, with bras and tights made for purpose. From low to high support. Maximum comfort. We design, innovate and iterate. Testing new technologies in action. On the pitch, the tracks, the court, the pool. Retro sportswear inspires new streetwear essentials. Like NMD, and our Firebird tracksuits. Classic sports models are brought back to life. Like Stan Smith. And Superstar. Now seen on the streets and the stages.
                    Through our collections we blur the borders between high fashion and high performance. Like our adidas by Stella McCartney athletic clothing collection – designed to look the part inside and outside of the gym. Or some of our adidas Originals lifestyle pieces, that can be worn as sportswear too. Our lives are constantly changing. Becoming more and more versatile. And adidas designs with that in mind.
                </p>
            </div>
        </div>
    </footer>
</body>
</html>
