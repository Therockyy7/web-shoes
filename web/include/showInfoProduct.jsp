<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Products"%>

<%
    Products product = (Products) request.getAttribute("product");
    String[] url = product.getImageURL().split(";");
%>

<html>
    <head>
        <title>Vike Online - Shopping</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />
        <link rel="shortcut icon" href="image/logo/logoSHop.png" type="image/x-icon">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="style/header.css">
        <link rel="stylesheet" href="style/header-video-trailer.css">
        <!--<link rel="stylesheet" href="style/middle.css">-->
        <link rel="stylesheet" href="style/middle-poster.css">
        <link rel="stylesheet" href="style/list-color.css">
        <link rel="stylesheet" href="style/footer.css">
        <link rel="stylesheet" href="style/card.css">
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
                        <a href="#" class="link">TRẢ HÀNG DỄ DÀNG</a>
                    </div>
                    <div class="text">
                        <div class="btn_two">
                            <label for="check">
                                <i class="fa fa-times"></i>
                            </label>
                        </div>
                        <h2>GIAO HÀNG MIỄN PHÍ CHO THÀNH VIÊN CỦA ADICLUB</h2>
                        <p class="content">
                            Đăng ký thành viên adiClub để hưởng thụ dịch vụ giao hàng miễn phí! Hoặc bạn chỉ được nhận ưu đãi miễn phí giao hàng với hóa đơn có trị giá ít nhất 1.6 triệu đồng.
                        </p>
                        <a href="#" class="link">THAM GIA NGAY</a>
                    </div>
                </div>
            </div>
            <div class="navbar">
                <div class="container">
                    <div class="left-section">
                        <a href="index.jsp">
                            <img src="image/logo/logo_title.png" alt="#">
                        </a>
                    </div>
                    <div class="middle-section">
                        <nav>
                            <ul>
                                <li><a href="include/nam.jsp">Nam</a></li>
                                <li><a href="include/nu.jsp">Nữ</a></li>
                                <li><a href="include/discount.jsp">Giảm giá</a></li>
                                <li><a href="include/all.jsp">Tất cả</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="right-section">
                        <div class="container">
                            <div class="search-place">
                                <form id="searchForm" action="SearchServlet" method="get"> <!-- URL phải khớp với @WebServlet("/search") -->
                                    <input id="searchInput" class="search-bar" type="text" name="query" placeholder="Tìm kiếm">
                                    <button type="submit" class="search-button">
                                        <img class="search-icon" src="icons/search.svg" alt="#">
                                    </button>
                                </form>
                            </div>
                            <a href="include/sigin.jsp">
                                <img class="icon-head" src="icons/user.png" alt="#">
                            </a>
                            <a href="include/wishList.jsp">
                                <img class="icon-head" src="icons/love-hand-drawn-heart-symbol-outline.png" alt="#">
                            </a>
                            <div class="notification-item">
                                <a href="include/shopBag.jsp">
                                    <div class="shopBag-container">
                                        <img class="icon-head" src="icons/shopping-bag.png" alt="#">
                                    </div>
                                </a>
                                <div class="tool-shop">Túi của bạn trống</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="middle">
            <div class="container">
                <div class="row">
                    <!-- Left Column / Product Image -->
                    <div class="left-column col-md-6 mb-4">
                        <div class="awSlider">                   
                            <div class="carousel slide" data-bs-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <% for (int i = 0; i < url.length; i++) {%>
                                    <li data-bs-target=".carousel" data-bs-slide-to="<%= i%>" <%= i == 0 ? "class='active'" : ""%>></li>
                                        <% } %>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <% for (int i = 0; i < url.length; i++) {%>
                                    <div class="carousel-item <%= i == 0 ? "active" : ""%>">
                                        <img src="<%= url[i]%>" class="d-block w-100" alt="Slide <%= i%>">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                    <% }%>
                                </div>

                                <!-- Controls -->
                                <button class="carousel-control-prev" type="button" data-bs-target=".carousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target=".carousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="right-column col-md-6 mb-4">
                        <!-- Product Description -->
                        <div class="product-description">
                            <span><%= product.getBrand()%></span>
                            <h1><%= product.getName()%></h1>
                            <p><%= product.getDescription()%></p>
                        </div>

                        <!-- Product Pricing -->
                        <div class="product-price">                       
                            <span>$<%= product.getPrice()%></span>
                            <div class="quantity">
                                <label for="quantity">Số lượng:</label>
                                <input type="number" id="quantity" name="quantity" min="1" value="1" max="<%= product.getStockQuantity()%>">
                                <label>Số sản phẩm còn:</label>
                                <b><%= product.getStockQuantity()%></b>
                            </div>
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <style>
            awSlider .carousel{
                display:table;
                z-index:2;
                -moz-box-shadow: 0 0 4px #444;
                -webkit-box-shadow: 0 0 4px #444;
                box-shadow: 0 0 15px rgba(1,1,1,.5);
            }

            .carousel-caption {

            }

            .carousel-indicators [data-bs-target] {
                background-color: #0d6efd;
                transition: background-color 0.5s ease;
                height: 5px;
            }

            .carousel-indicators [data-bs-target].active {
                background-color: #000;
            }

            .carousel-control-next, .carousel-control-prev {
                width: 50px;
                background-color: #cccccc; /* Ensure the base color is applied to both */
            }

            .carousel-control-next:hover, .carousel-control-prev:hover {
                background-color: #cccccc; /* Ensure hover color is applied to both */
            }

            section.awSlider{
                margin:30px auto;
                padding:30px;
                position:relative;
                display:table;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            section.awSlider:hover > img{
                -ms-transform: scale(1.2);
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
                opacity:1;
            }

            section.awSlider img{
                pointer-events: none;
            }

            section.awSlider > img{
                position:absolute;
                top:30px;
                z-index:1;
                transition:all .3s;
                filter: blur(1.8vw);
                -webkit-filter: blur(2vw);
                -moz-filter: blur(2vw);
                -o-filter: blur(2vw);
                -ms-filter: blur(2vw);
                -ms-transform: scale(1.1);
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
                opacity:.5;
            }

            section .carousel-item img {
                width: 100%;
                object-fit: cover; /* Đảm bảo ảnh không bị kéo ra khi thay đổi kích thước */
            }

            .right-column, .left-column {
                margin-top: 20px;
            }

            .product-description {
                margin-bottom: 20px;
                height: 85%;
            }

            .product-description span {
                font-size: 24px;
                color: #358ED7;
                letter-spacing: 1px;
                text-transform: uppercase;
                text-decoration: none;
            }

            .product-description h1 {
                font-weight: 300;
                font-size: 48px;
                color: #43484D;
                letter-spacing: -2px;
                text-shadow:
                    -1px -1px 0 #000,
                    1px -1px 0 #000,
                    -1px  1px 0 #000,
                    1px  1px 0 #000;
            }

            .product-description p {
                font-size: 20px;
                font-weight: 300;
                color: #86939E;
                line-height: 24px;
            }

            .product-price {
                border-top: 5px solid #E1E8EE;
                display: flex;
                align-items: center;
                height: 10%;
            }

            .product-price span {
                font-size: 26px;
                font-weight: 300;
                color: #43474D;
                margin-right: 20px;
                margin-top: 15px;
            }

            .product-price .quantity {
                display: flex;
                align-items: center;
                margin-right: 20px;

                margin-top: 10px;
            }

            .product-price .quantity label {
                margin-left: 10px;
                margin-right: 10px;
                font-size: 18px;
                font-weight: 300;
                color: #43474D;
            }

            .product-price .quantity input {
                width: 60px;
                padding: 5px;
                font-size: 18px;
                text-align: center;
                border: 1px solid #E1E8EE;
                border-radius: 5px;
            }
            .product-price .quantity b{
                font-size: 18px;
            }

            .btn.btn-primary {
                display: inline-block;
                border-radius: 6px;
                font-size: 16px;
                color: #FFFFFF;
                text-decoration: none;
                padding: 12px 30px;
                transition: all .5s;
                margin-top: 10px;
            }
            .btn.btn-primary:hover {
                background-color: #64af3d;
            }
        </style>

        <script>
            $(document).ready(function () {
                $('.carousel').carousel({
                    interval: 2000  // Adjust interval as needed
                });
            });
        </script>

        <!-- Footer -->
        <footer>
            <div class="description">
                <div class="text">
                    <h1>
                        STORIES, STYLES AND SPORTSWEAR AT ADIDAS, SINCE 1949
                    </h1>
                    <p>
                        Sport keeps us fit. Keeps you mindful. Brings us together. Through sport we have the power to change lives.
                        Whether it is through stories of inspiring athletes. Helping you to get up and get moving. Sportswear
                        featuring the latest technologies, to up your performance. Beat your PB.adidas offers a home to the runner,
                        the basketball player, the soccer kid, the fitness enthusiast. The weekend hiker that loves to escape the
                        city. The yoga teacher that spreads the moves. The 3-Stripes are seen in the music scene. On stage, at
                        festivals. Our sports clothing keeps you focused before that whistle blows. During the race. And at the
                        finish lines. We’re here to supportcreators. Improve their game. Their lives. And change the world.

                        adidas is about more than sportswear and workout clothes. We partner with the best in the industry to
                        co-create. This way we offer our fans the sports apparel and style that match their athletic needs, while
                        keeping sustainability in mind. We’re here to support creators. Improve their game. Create change. And we
                        think about the impact we have on our world.

                    </p>
                </div>
                <div class="text">
                    <h1>
                        Workout clothes, for any sport
                    </h1>
                    <p>
                        adidas designs for and with athletes of all kinds. Creators, who love to change the game. Challenge
                        conventions. Break the rules and define new ones. Then break them again. We supply teams and individuals
                        with athletic clothing pre-match. To stay focussed. We design sports apparel that get you to the finish
                        line. To win the match. We support women, with bras and tights made for purpose. From low to high support.
                        Maximum comfort. We design, innovate and itterate. Testing new technologies in action. On the pitch, the
                        tracks, the court, the pool. Retro workout clothes inspire new streetwear essentials. Like NMD, Ozweego and
                        our Firebird tracksuits. Classic sports models are brought back to life. Like Stan Smith. And Superstar. Now
                        seen on the streets and the stages.
                    </p>
                </div>
            </div>

            <div class="information-support">
                <div class="item infor">
                    <h4>SẢN PHẨM</h4>
                    <a href="#">Giày</a>
                    <a class="py-2" href="#">Hàng mới về</a>
                    <a href="#">Top Sellers</a>
                </div>
                <div class="item-sport infor">
                    <h4>THỂ THAO</h4>
                    <a href="#">Chạy</a>
                    <a class="py-2" href="#">Thời trang</a>
                    <a href="#">Bóng rổ</a>
                </div>

                <div class="support infor">
                    <h4>HỔ TRỢ</h4>
                    <a href="#">Biểu đồ kích cỡ</a>
                    <a class="py-2" href="#">Thanh toán</a>
                    <a href="#">Trả Hàng & Hoàn Tiền</a>
                </div>
                <div class="social infor">
                    <h4>THEO DÕI CHÚNG TÔI</h4>
                    <div class="rounded-social-buttons">
                        <a class="social-button facebook" href="https://www.facebook.com/" target="_blank"><i
                                class="fa fa-facebook-square"></i></a>
                        <a class="social-button twitter" href="https://www.twitter.com/" target="_blank"><i
                                class="fa fa-twitter-square"></i></a>
                        <a class="social-button linkedin" href="https://www.linkedin.com/" target="_blank"><i
                                class="fa fa-linkedin"></i></a>
                        <a class="social-button tiktok" href="https://www.tiktok.com/" target="_blank"><i
                                class="fab fa-tiktok text-white" uk-icon="tiktok"></i></a>
                        <a class="social-button youtube" href="https://www.youtube.com/" target="_blank"><i
                                class="fa fa-youtube-play"></i></a>
                        <a class="social-button instagram" href="https://www.instagram.com/" target="_blank"><i
                                class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>

            <div class="foot-end">
                <p>© 2020 Công ty TNHH adidas Việt Nam</p>
            </div>

        </footer>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
