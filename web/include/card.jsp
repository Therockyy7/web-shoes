<%-- Document : card Created on : Jun 28, 2024, 10:29:43 PM Author : LENOVO --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <%@page import="model.Products" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <title>Tất cả sản phẩm</title>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

                    <!-- UIkit CSS -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />

                    <link rel="shortcut icon" href="image/logo/logoSHop.png" type="image/x-icon">

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                        crossorigin="anonymous">
                    <link rel="stylesheet" href="style/header.css">
                    <link rel="stylesheet" href="style/header-video-trailer.css">
                    <link rel="stylesheet" href="style/tabs.css">
                    <link rel="stylesheet" href="style/footer.css">
                    <link rel="stylesheet" href="style/card.css">
                    <link rel="stylesheet" href="style/checkBoxOfCard.css">
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
                                        Nếu bạn không hài lòng với đơn hàng của mình, bạn có thể được hoàn lại tiền. Vui
                                        lòng xem Chính Sách Trả Hàng của chúng tôi để biết thêm chi tiết.
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
                                        Đăng ký thành viên adiClub để hưởng thụ dịch vụ giao hàng miễn phí! Hoặc bạn chỉ
                                        được nhận ưu đãi miễn phí giao hàng với hóa đơn có trị giá ít nhất 1.6 triệu
                                        đồng

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
                                        <img src="image/logo/logoSHop.png" alt="#">
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
                                                <input id="searchInput" class="search-bar" type="text" name="query"
                                                    placeholder="Tìm kiếm">
                                                <button type="submit" class="search-button">
                                                    <img class="search-icon" src="icons/search.svg" alt="#">
                                                </button>
                                            </form>
                                        </div>
                                        <a href="include/sigin.jsp">
                                            <img class="icon-head" src="icons/user.png" alt="#">
                                        </a>
                                        <a class="relate" href="ShowWishListServlet?action=showWishLish">
                                            <img class="icon-head" src="icons/love-hand-drawn-heart-symbol-outline.png"
                                                alt="#">
                                            <div class="quantity js-wishList-quantity"></div>
                                        </a>
                                        <div class="notification-item">
                                            <a href="ShowAddToBag?action=showBag">
                                                <div class="shopBag-container relate">
                                                    <img class="icon-head" src="icons/shopping-bag.png" alt="#">
                                                    <div class="quantity js-bag-quantity"></div>
                                                </div>
                                            </a>
                                            <!--<div class="tool-shop">Túi của bạn trống</div>-->
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- ---------- -->
                    <!-- Tabs navs -->
                    <div class="tabs-nav">
                        <div class="container-tab">
                            <div class="tab"><a class="tab-index" href="index.jsp">TRANG CHỦ</a></div>
                            <div class="tab"><a href="include/nam.jsp">Giày Nam</a></div>|
                            <div class="tab"><a href="include/nu.jsp">Giày Nữ</a></div>|
                            <div class="tab"><a href="include/newArrival.jsp">New arrivals</a></div>
                        </div>
                    </div>
                    <% Products product=(Products) request.getAttribute("product"); 
                    String[] url=product.getImageURL().split(";"); 
                    String[] size = product.getSize().split(";");
                    %>

                        <div class="container-card">
                            <div class="container-right p-5">
                                <div class="image-product">
                                    <% for(int i=0; i < url.length; i++){ %>
                                        <img src="<%= url[i]%>" alt="">
                                        <% } %>

                                </div>

                                <div class="accordion p-5" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseOne" aria-expanded="true"
                                                aria-controls="collapseOne">
                                                Brand
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show"
                                            aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <strong>${product.brand}.</strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingTwo">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                aria-expanded="false" aria-controls="collapseTwo">
                                                Description
                                            </button>
                                        </h2>
                                        <div id="collapseTwo" class="accordion-collapse collapse"
                                            aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                ${product.description}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingThree">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                aria-expanded="false" aria-controls="collapseThree">
                                                Phù hợp
                                            </button>
                                        </h2>
                                        <div id="collapseThree" class="accordion-collapse collapse"
                                            aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <Strong>${categories.name}.</strong> ${categories.description}.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-left">
                                <div class="information">
                                    <h2>${product.name}</h2>
                                    <p class="price fw-semibold">${price}</p>
                                    <!-- <div class="fw-semibold">Màu sắc</div>
                 <div class="product-color">
                    <a class="color" href="#"><img src="../image/color/Screenshot 2024-06-23 160841.png" alt="#"></a>
                    <a class="color" href="#"><img src="./image/color/Screenshot 2024-06-23 160859.png" alt="#"></a>
                </div>  -->
                                    
                                    <div class="fw-semibold">Kích cỡ</div>
                                    <form id="addToBagForm" action="ShowAddToBag" method="get">
                                        <input type="hidden" name="action" value="addToBag" />
                                        <input type="hidden" name="id" value="${product.productID}" />

                                        <div class="checkbox-wrapper-47">
                                            
                                            <%
                                            for(int i = 0; i < size.length; i++){
                                                int count = 0;
                                                if(count == 0){
                                                %>
                                                    <input type="radio" class="btn-check" name="checkboxes" id="cb-<%=size[i]%>" value="<%=size[i]%>" autocomplete="off" checked="">
                                                    <label class="btn btn-light" for="cb-<%=size[i]%>"><%=size[i]%></label>
                                                    
                                                <%
                                                    count++;
                                                    }else{
                                                %>

                                                    <input type="radio" class="btn-check" name="checkboxes" id="cb-<%=size[i]%>" value="<%=size[i]%>" autocomplete="off">
                                                    <label class="btn btn-light" for="cb-<%=size[i]%>"><%=size[i]%></label>
                                                <%
                                                    }
                                                %>
                                            <%
                                                }
                                            %>
                                
                                        </div>

                                        <div class="btn-space">

                                            <button type="button" id="addToBagButton" class="button-86 uk-margin-top text-light btn btnOption" data-id="${product.productID}" align="center">THÊM VÀO GIỎ HÀNG</button>

                                            <a href="ShowWishListServlet?id=${product.productID}&action=addWishLish"
                                               class="button-55 add-to-wishlist" data-id="${product.productID}" role="button">
                                                <div class="heart-like-button"></div>
                                            </a>

                                        </div>
                                    </form>

                                    <div class="uk-margin-top">
                                        <span class="uk-margin-small-right text-decoration-underline" uk-icon="tag">
                                            Hoàn trả dễ dàng</span><br>
                                        <span class="uk-margin-small-right text-decoration-underline" uk-icon="tag">
                                            FREE SHIPPING FOR ADICLUB MEMBERS!</span>

                                    </div>


                                </div>

                            </div>

                        </div>




                        <footer>
                            <div class="description">
                                <div class="text">
                                    <h1>
                                        ADIDAS MEN’S CLOTHING & SHOES
                                    </h1>
                                    <p>
                                        Our wins are ours to gain. adidas clothing & shoes don’t break our PB.
                                        We do. That extra mile. One more rep. Leg day, run away or lounge all day. Find
                                        something to match you. Jerseys for the player, or the fan. Running shoes to run
                                        on, or to walk in.
                                        Training gear for weekday practise, or Sunday chill. A pair of white trainers to
                                        go with… basically anything. All we need is us. All we want is here, in men’s
                                        apparel and footwear.
                                    </p>
                                </div>

                            </div>
                            <div class="description-bottom">
                                <div class="text text-center">
                                    <h1>
                                        TRỞ THÀNH HỘI VIÊN & HƯỞNG ƯU ĐÃI 15%
                                    </h1>
                                    <div class="content-description">
                                        <a class="btn" href="#">ĐĂNG KÝ NGAY</a>
                                    </div>
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
                                        <a class="social-button facebook" href="https://www.facebook.com/"
                                            target="_blank"><i class="fa fa-facebook-square"></i></a>
                                        <a class="social-button twitter" href="https://www.twitter.com/"
                                            target="_blank"><i class="fa fa-twitter-square"></i></a>
                                        <a class="social-button linkedin" href="https://www.linkedin.com/"
                                            target="_blank"><i class="fa fa-linkedin"></i></a>
                                        <a class="social-button tiktok" href="https://www.tiktok.com/"
                                            target="_blank"><i class="fab fa-tiktok text-white"
                                                uk-icon="tiktok"></i></a>
                                        <a class="social-button youtube" href="https://www.youtube.com/"
                                            target="_blank"><i class="fa fa-youtube-play"></i></a>
                                        <a class="social-button instagram" href="https://www.instagram.com/"
                                            target="_blank"><i class="fa fa-instagram"></i></a>
                                    </div>
                                    <!-- <a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
                <a class="py-2" href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a>
                <a class="py-2" href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a> -->
                                </div>
                            </div>

                            <div class="foot-end">
                                <p>© 2020 Công ty TNHH adidas Việt Nam</p>
                            </div>

                        </footer>
                        <script>
                            
                            // const button = document.querySelector(".heart-like-button");

                            // button.addEventListener("click", () => {
                            //     if (button.classList.contains("liked")) {
                            //         button.classList.remove("liked");
                            //     } else {
                            //         button.classList.add("liked");
                            //     }
                            // });

                           

                            let wishList = JSON.parse(localStorage.getItem('wishList')) || [];
                            let bag = JSON.parse(localStorage.getItem('bag')) || [];

                            function updateQuantity_bag() {
                                document.querySelector('.js-bag-quantity').innerHTML = bag.length;
                            }

                            function saveBagToStorage() {
                                localStorage.setItem('bag', JSON.stringify(bag));
                            }

                            function updateQuantity_wishList() {
                                document.querySelector('.js-wishList-quantity').innerHTML = wishList.length;
                            }

                            function saveWishListToStorage() {
                                localStorage.setItem('wishList', JSON.stringify(wishList));
                            }

                            document.addEventListener('DOMContentLoaded', function () {
                                updateQuantity_wishList();

                                document.querySelectorAll('.add-to-wishlist').forEach(function (element) {
                                    element.addEventListener('click', function (event) {
                                        event.preventDefault(); // Prevent the default action (navigation)
                                    
                                        const productId = this.getAttribute('data-id');
                                        const index = wishList.indexOf(productId);
                                        if (index === -1) {
                                            wishList.push(productId);
                                            this.querySelector('.heart-like-button').classList.add('liked');
                                            console.log('Added to wishlist');
                                        } else {
                                            wishList.splice(index, 1);
                                            this.querySelector('.heart-like-button').classList.remove('liked');
                                            console.log('Removed from wishlist');
                                        }

                                        saveWishListToStorage();
                                        updateQuantity_wishList();
                                        
                                        var actionUrl = `ShowWishListServlet?id=${product.productID}&action=addWishLish`;

                                        var xhr = new XMLHttpRequest();
                                        xhr.open('GET', actionUrl, true);
                                        xhr.onload = function () {
                                            if (xhr.status === 200) {
                                                // Handle the response here (e.g., show a success message, update the UI)
                                                //                        alert('Product added to wishlist successfully!');
                                            } else {
                                                // Handle errors here
                                                console.error('Error adding product to wishlist:', xhr.statusText);
                                            }
                                        };
                                        xhr.onerror = function () {
                                            // Handle network errors here
                                            console.error('Network error.');
                                        };
                                        xhr.send();
                                    });
                                });

                                // Set initial state of heart-like-button
                                document.querySelectorAll('.add-to-wishlist').forEach(function (element) {
                                    const productId = element.getAttribute('data-id');
                                    if (wishList.includes(productId)) {
                                        element.querySelector('.heart-like-button').classList.add('liked');
                                    }
                                });

                            });


                            document.addEventListener('DOMContentLoaded', () => {
                                updateQuantity_bag();
                                document.getElementById('addToBagButton').addEventListener('click', function(event) {
                                 
                                        event.preventDefault();

                                        const productId = this.getAttribute('data-id');
                                        const index = bag.indexOf(productId);
                                        if (index === -1) {
                                            bag.push(productId);
                                            
                                            console.log('Added to bag');
                                        } else {
                                            bag.splice(index, 1);
                                           
                                            console.log('Removed from bag');
                                        }
                                        updateQuantity_bag();
                                        saveBagToStorage();

                                        var form = document.getElementById('addToBagForm');
                                        var formData = new FormData(form);
                                        var xhr = new XMLHttpRequest();
                                        var params = new URLSearchParams(formData).toString();
    
                                        var actionUrl = 'ShowAddToBag' + '?' + params;
                                        console.log('Action URL:', actionUrl);
    
                                        xhr.open('GET', actionUrl);
                                        xhr.onload = function() {
                                            if (xhr.status === 200) {
                                                console.log('Product added to bag successfully!');
                                                // Handle success message or update UI
                                            } else {
                                                console.error('Error adding product to bag:', xhr.statusText);
                                                // Handle error message or update UI
                                            }
                                        };
                                        xhr.onerror = function() {
                                            console.error('Network error.');
                                            // Handle network error
                                        };
                                        xhr.send();
                                 });
                            });
                        </script>

                        <!-- UIkit JS -->
                        <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit-icons.min.js"></script>
                        <!-- bootstrap -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                            crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                            crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
                            crossorigin="anonymous"></script>

                        <script src="js/pagination_all.js"></script>
                        <script src="js/addToWishListAndBag.js"></script>
                </body>



                </html>