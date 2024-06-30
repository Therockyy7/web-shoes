<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="model.Products"%>
<%@ page import="java.util.ArrayList"%>
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


        <link rel="shortcut icon" href="image/logo/logoSHop.png" type="image/x-icon">

        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="style/header.css">
        <link rel="stylesheet" href="style/header-video-trailer.css">
        <link rel="stylesheet" href="style/middle.css">
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
                            Nếu bạn không hài lòng với đơn hàng của mình, bạn có thể được hoàn lại tiền. Vui lòng xem Chính Sách Trả
                            Hàng của chúng tôi để biết thêm chi tiết.
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
                            Đăng ký thành viên adiClub để hưởng thụ dịch vụ giao hàng miễn phí! Hoặc bạn chỉ được nhận ưu đãi miễn phí
                            giao hàng với hóa đơn có trị giá ít nhất 1.6 triệu đồng

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
                            <img src="image/logo/logo_title.png" alt="#">
                        </a>
                    </div>
                    <div class="middle-section ">
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

            <!-- trailer-head -->
            <div class="trailer-video">
                <div class="content-video">
                    <h1>YOU GOT THIS</h1>
                    <p>Khi bạn chơi không chút kỳ vọng, áp lực không thể chiếm lĩnh</p>
                    <a href="#">KHÁM PHÁ THÊM</a>
                </div>
                <video class="video-trailer" src="video/290174dd-91ef-4270-b067-dc1707ce7435.mp4" loop muted autoplay></video>
                <button class="playPause" onclick="playPause()">
                    <i class="situation-video fa fa-play " aria-hidden="true"></i>
                </button>
                <button class="mute muted" onclick="volume()">
                    <div class="slash"></div>
                    <i class="situation-video fa fa-volume-up" aria-hidden="true"></i>
                </button>
            </div>
        </div>

        <section class="middle">
            <div class="container-middle">

                <div class="tab-item" style="padding-bottom: 40px;">
                    <div class="link-item">
                        <a href="#">Hàng mới về</a>
                        <a href="#">Premium</a>
                        <a href="#">Giày dép hè</a>
                        <a href="#">Summer outfit</a>
                        <a href="#">Discount</a>
                        <a href="#">xem Thêm</a>
                    </div>
                </div>

                <div class="row">
                    <!-- Loop through each product and generate product card -->
                    <% ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("searchResults");
                        if (products != null) {
                            for (int i = 0; i < products.size(); i++) {
                                Products product = products.get(i);
                                String[] url = product.getImageURL().split(";");
                    %>
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <img src="<%= url[0]%>" class="card-img-top fixed-size-img" alt="<%= product.getName()%>">
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getName()%></h5>
                                <p class="card-text"><%= product.getDescription()%></p>
                                <p class="card-text">Price: $<%= product.getPrice()%>/VNĐ</p>
                                <a href="#" class="btn btn-primary">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    <% }
                    } else { %>
                    <p>Không tìm thấy kết quả nào.</p>
                    <% }%>
                </div>
            </div>
                
        </section>

        <style>
            .product-list {
                display: flex;
                flex-wrap: wrap;
            }

            .product-item {
                flex: 0 0 calc(25% - 1rem); /* 25% width for each item, adjust margin as needed */
                margin-bottom: 1rem; /* Optional margin between items */
                box-sizing: border-box;
            }
            .card-body {
                height: 200px; /* Chiều cao cố định */
                overflow: hidden; /* Ẩn phần nội dung thừa */
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .card-title {
                font-size: 1.25rem;
                font-weight: bold;
                white-space: nowrap; /* Ngăn không cho từ xuống dòng */
                overflow: hidden; /* Ẩn phần nội dung thừa */
                text-overflow: ellipsis; /* Hiển thị ... khi vượt quá */
            }

            .card-text {
                overflow: hidden; /* Ẩn phần nội dung thừa */
                text-overflow: ellipsis; /* Hiển thị ... khi vượt quá */
                display: -webkit-box;
                -webkit-line-clamp: 1; /* Giới hạn số dòng tối đa hiển thị */
                -webkit-box-orient: vertical;
            }

            .card-img-top {
                width: 100%;
                height: 400px; /* Chiều cao cố định cho hình ảnh */
                object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
            }
        </style>

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

    </body>

    <script>
        let video = document.querySelector(".video-trailer");
        const videoSituation = document.querySelector(".playPause");
        const videoVolume = document.querySelector(".mute");
        function playPause() {
            if (video.paused) {
                videoSituation.innerHTML = `<i class="situation-video fa fa-pause " aria-hidden="true"></i>`;

                video.play();
            } else {
                videoSituation.innerHTML = `<i class="situation-video fa fa-play " aria-hidden="true"></i>`;

                video.pause();
            }
        }

        function volume() {
            video.muted = !video.muted;
            videoVolume.classList.toggle("muted");
        }
    </script>
    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit-icons.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>

</html>