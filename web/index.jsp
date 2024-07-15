<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

    <head>
        <title>Vike Online - Shopping</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
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
        <link rel="stylesheet" href="style/panel.css">
        <link rel="stylesheet" href="style/loading.css">
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
                                <!--<li><a href="include/discount.jsp">Giảm giá</a></li>-->
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
                                        <img class="search-icon" src="icons/search.svg" alt="#">
                                    </button>
                                </form>
                            </div>
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <div id="userPanel" class="user-panel">
                                        <a href="javascript:void(0);" id="userIcon" onclick="toggleUserInfo()">
                                            <img class="icon-head" src="icons/user.png" alt="#">
                                        </a>
                                        <div id="userInfo" class="user-info">
                                            <table>
                                                <tr>
                                                    <td>${sessionScope.user.username}</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href="LogoutServlet" class="logout-link">
                                                            <img class="icon-logout" src="icons/logout.png" alt="Logout Icon"> Logout
                                                        </a>
                                                    </td>
                                                </tr>
                                                <!-- Thêm các option khác ở đây -->
                                            </table>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <a href="login.jsp">
                                        <img class="icon-head" src="icons/user.png" alt="#">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <a class="relate" href="ShowWishListServlet?action=showWishLish">
                                <img class="icon-head" src="icons/love-hand-drawn-heart-symbol-outline.png" alt="#">
                                <div class="quantity js-wishList-quantity">0</div>
                            </a>
                            <div class="notification-item">
                                <a href="ShowAddToBag?action=showBag">
                                    <div class="shopBag-container relate">
                                        <img class="icon-head" src="icons/shopping-bag.png" alt="#">
                                        <div class="quantity js-bag-quantity">0</div>
                                    </div>
                                </a>
                                <!--<div class="tool-shop">Túi của bạn trống</div>-->
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


        <!-- middle -->
        <section class="middle">



            <div class="container-middle">

                <div class="tab-item flex">
                    <div class="link-item">
                        <a href="#">Hàng mới về</a>
                        <a href="#">Premium</a>
                        <a href="#">Giày dép hè</a>
                        <a href="#">Summer outfit</a>
                        <a href="#">Discount</a>
                        <a href="#">Xem thêm</a>

                    </div>

                </div>

                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                                aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row row-cols-1 row-cols-md-5 g-2">
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/logo_title.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/logoSHop.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="carousel-item active">
                            <div class="row row-cols-1 row-cols-md-5 g-2">
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/logo_title.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/logoSHop.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="card h-80">
                                        <img src="image/logo/shoes_logo.png" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">giay</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">$2000</small>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon text-dark " aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon text-dark" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <!-- poster -->
                <div class="poster-middle-section">
                    <div class="container-poster">
                        <img src="image/076cc0969868ecd40bc47aa9291796e1.jpg" alt="@">

                        <form action="SendEmailOrder" method="post" style="width: 26rem;">
                            <input type="hidden" name="action" value="sendEmail" />
                            <!-- Name input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="form4Example1" class="form-control" name="name"/>
                                <label class="form-label" for="form4Example1">Name</label>
                            </div>

                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="email" id="form4Example2" class="form-control" name="email" />
                                <label class="form-label" for="form4Example2">Email address</label>
                            </div>

                            <!-- Message input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <textarea class="form-control" id="form4Example3" rows="4" name="message"></textarea>
                                <label class="form-label" for="form4Example3">Message</label>
                            </div>

                            <!-- Checkbox -->
                            <div class="form-check d-flex justify-content-center mb-4">
                                <input class="form-check-input me-2" type="checkbox" value="" id="form4Example4" checked />
                                <label class="form-check-label" for="form4Example4">
                                    Send me a copy of this message
                                </label>
                            </div>

                            <!-- Submit button -->
                            <button data-mdb-ripple-init type="submit" class="btn btn-block mb-4">Send</button>
                        </form>

                        <video class="poster-video" src="video/b393da5084a0c6fc6028535f7b382111.mp4" loop muted autoplay></video>
                    </div>

                    //collection
                    <div class="container-list-color">
                        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="10000">
                                    <div class="row row-cols-1 row-cols-md-4 g-4">
                                        <div class="col">
                                            <div class="card h-100 uk-card-hover">
                                                <a class="text-decoration-none text-dark" href="listCollection?collectionID=1">
                                                <img
                                                    src="https://tinyurl.com/yezj9y3n"
                                                    class="card-img-top" alt="Advancement Pack">
                                                <div class="card-body">
                                                    <h5 class="card-title">Advancement Pack</h5>
                                                    <p class="card-text">Khám phá giày F50, Predator và Copa mới.</p>
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="card h-100 uk-card-hover">
                                                <a class="text-decoration-none text-dark" href="listCollection?collectionID=2">
                                                <img
                                                    src="https://tinyurl.com/ykmpmykr"
                                                    class="card-img-top" alt="The 80s Collection">
                                                <div class="card-body">
                                                    <h5 class="card-title">The 80's Collection</h5>
                                                    <p class="card-text">Sẵn sàng tái hiện phong cách retro.</p>
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="card h-100 uk-card-hover">
                                                <a class="text-decoration-none text-dark" href="listCollection?collectionID=3">
                                                <img
                                                    src="https://tinyurl.com/vk3t7pu5"
                                                    class="card-img-top" alt="Song for the Mute">

                                                <div class="card-body">
                                                    <h5 class="card-title">Song for the Mute</h5>
                                                    <p class="card-text">Khám phá bộ sưu tập mới gợi nhớ về hoài niệm tương lai.</p>
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="card h-100 uk-card-hover">
                                                <a class="text-decoration-none text-dark" href="listCollection?collectionID=4">
                                                <img 
                                                    src="https://tinyurl.com/bddsc35c"
                                                    class="card-img-top" alt="D.O.N. Issue #6">

                                                <div class="card-body">
                                                    <h5 class="card-title">D.O.N. Issue #6</h5>
                                                    <p class="card-text">Đôi giày hiệu năng đặc trưng đến từ Donovan Mitchell.</p>
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                             
                            </div>
                            
                            
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                </div>



            </div>



        </section>
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

    <script> // Panel user
        function toggleUserInfo() {
            var userInfo = document.getElementById("userInfo");
            if (userInfo.style.display === "none" || userInfo.style.display === "") {
                userInfo.style.display = "block";
            } else {
                userInfo.style.display = "none";
            }
        }

        document.addEventListener('click', function (event) {
            var userInfo = document.getElementById("userInfo");
            var userIcon = document.getElementById("userIcon");
            if (userInfo && userIcon) {
                if (!userIcon.contains(event.target) && !userInfo.contains(event.target)) {
                    userInfo.style.display = "none";
                }
            }
        });

    </script>

    <script>
        let wishList = JSON.parse(localStorage.getItem('wishList')) || [];
        document.querySelector('.js-wishList-quantity').innerHTML = wishList.length;
        
        let bag = JSON.parse(localStorage.getItem('bag')) || [];
        document.querySelector('.js-bag-quantity').innerHTML = bag.length;
    // Trailer header
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

        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện click vào biểu tượng người dùng
            document.getElementById('userIcon').addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

                // Toggle hiển thị/ẩn thông tin người dùng
                var userInfoPanel = document.getElementById('userInfo');
                userInfoPanel.classList.toggle('hidden');
            });
        });

        
       
        
           
       
    </script>
    <script src="js/loading.js"></script>
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