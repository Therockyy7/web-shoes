<%-- 
    Document   : nam
    Created on : Jun 22, 2024, 6:35:24 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
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

    <link rel="shortcut icon" href="../image/logoSHop.png" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    
    <link rel="stylesheet" href="../style/header.css">
    <link rel="stylesheet" href="../style/header-video-trailer.css">
    <link rel="stylesheet" href="../style/middle.css">
    <link rel="stylesheet" href="../style/middle-poster.css">
    <link rel="stylesheet" href="../style/list-color.css">
    <link rel="stylesheet" href="../style/footer.css">

    <link rel="stylesheet" href="../style/nam.css">
</head>

<body>
    <!-- Header -->
    <div class="header">


        <!-- trailer-head -->
        <div class="trailer-video">
            <div class="content-video">
                <h1>YOU GOT THIS</h1>
                <p>Khi bạn chơi không chút kỳ vọng, áp lực không thể chiếm lĩnh</p>
                <a href="#">KHÁM PHÁ THÊM</a>
            </div>
            <video class="video-trailer" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_1920,w_1920/originals_fw24_t_toe_samba_mh_d_4222835bb4.mp4" loop muted
                autoplay data-video-id="1"></video>
            <button class="playPause" data-video-id="1">
                <i class="situation-video fa fa-play " aria-hidden="true"></i>
            </button>
        
        </div>
        <div class="trailer-video">
            <div class="content-video">
                <h1>YOU GOT THIS</h1>
                <p>Khi bạn chơi không chút kỳ vọng, áp lực không thể chiếm lĩnh</p>
                <a href="#">KHÁM PHÁ THÊM</a>
            </div>
            <video class="video-trailer" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_1920,w_1920/Training_FW_24_Dropset3_Global_Launch_GLP_Male_Hero_Banner_d_6692aa3301.mp4" loop muted
                autoplay data-video-id="2"></video>
            <button class="playPause" data-video-id="2">
                <i class="situation-video fa fa-play " aria-hidden="true"></i>
            </button>
        </div>
    </div>


    <!-- middle -->
    <section class="middle">



        <div class="container-middle">

            <div class="tab-item">
                <div class="link-item">
                    <a href="#">Hàng mới về</a>
                    <a href="#">Premium</a>
                    <a href="#">Giày dép hè</a>
                    <a href="#">Summer outfit</a>
                    <a href="#">Discount</a>
                    <a href="#">xem Thêm</a>

                </div>

            </div>

            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
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
                                    <img src="../image/logo/logo_title.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/logoSHop.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/logo_title.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/logoSHop.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
                                    <img src="../image/logo/shoes_logo.png" class="card-img-top" alt="...">
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
            <!-- <div class="poster-middle-section"> -->
                <div class="container-poster">
                    <div class="trailer-video">
                        <div class="content-video">
                            <h1>YOU GOT THIS</h1>
                            <p>Khi bạn chơi không chút kỳ vọng, áp lực không thể chiếm lĩnh</p>
                            <a href="#">KHÁM PHÁ THÊM</a>
                        </div>
                        <video class="video-trailer" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_1920,w_1920/glbl_Brand_CH_2_football_fw24_EURO_ENG_Herobanner_d_d48d1c7cec.mp4" loop muted
                            autoplay data-video-id="3"></video>
                        <button class="playPause" data-video-id="3">
                            <i class="situation-video fa fa-play " aria-hidden="true"></i>
                        </button>
                        <button class="mute muted" data-video-id="3">
                            <div class="slash"></div>
                            <i class="situation-video fa fa-volume-up" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>

                <div class="container-list-color">
                    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <div class="row row-cols-1 row-cols-md-4 g-4">
                                    <div class="col">
                                        <a href="#">
                                            <div class="card h-100">
                                                <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_400,w_400/T_Carousel_1050x1400_f2233390ce.jpg" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a longer card with supporting text below as
                                                        a natural lead-in to additional content. This content is a little
                                                        bit longer.</p>
                                                </div>
                                            </div>
                                            
                                        </a>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_400,w_400/Training_SS_24_Strength_global_Exit_GLP_Male_Teaser_Card_d_59fd6ce9d6.jpg" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a short card.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <video  class="card-img-top" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_400,w_400/sustainability_ss24_mftp_launch_onsite_tcc_d_c195461f8c.mp4" muted autoplay></video>
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a longer card with supporting text below as
                                                    a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <video  class="card-img-top" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_400,w_400/football_fw24_f50_launch_glp_m_teaser_carousel_animated_new_d_af9da06309.mp4" muted autoplay></video>
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a longer card with supporting text below as
                                                    a natural lead-in to additional content. This content is a little
                                                    bit longer.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <div class="row row-cols-1 row-cols-md-4 g-4">
                                    <div class="col">
                                        <div class="card h-100">
                                            <video  class="card-img-top" src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_400,w_400/glbl_aclubs_realmadrid_home_football_ss24_launch_onsite_tcc_03_o_984a2290bd.mp4" muted autoplay></video>
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a longer card with supporting text below as
                                                    a natural lead-in to additional content. This content is a little
                                                    bit longer.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_400,w_400/fw24_sftm_tc_d_af448e3367.jpg" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a short card.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_400,w_400/specialitysports_ss24_padel_evergreen_structure_glpm_teaser_card_portrait_d_b2d761944d.jpg" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a short card.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_400,w_400/football_ss24_eurocopa_euro_combi_catlp_tcc_05479dd224.jpg" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">This is a short card.</p>
                                            </div>
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

            <!-- </div> -->



        </div>



    </section>
    <footer>
        <div class="description">
            <div class="text">
                <h1>
                    ADIDAS MEN’S CLOTHING & SHOES
                </h1>
                <p>
                    Our wins are ours to gain. adidas clothing & shoes don’t break our PB.
                    We do. That extra mile. One more rep. Leg day, run away or lounge all day. Find something to match you. Jerseys for the player, or the fan. Running shoes to run on, or to walk in.
                    Training gear for weekday practise, or Sunday chill. A pair of white trainers to go with… basically anything. All we need is us. All we want is here, in men’s apparel and footwear.
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
                    <a class="social-button facebook" href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    <a class="social-button twitter" href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter-square"></i></a>
                    <a class="social-button linkedin" href="https://www.linkedin.com/" target="_blank"><i class="fa fa-linkedin"></i></a>
                    <a class="social-button tiktok" href="https://www.tiktok.com/" target="_blank"><i class="fab fa-tiktok text-white" uk-icon="tiktok"></i></a>
                    <a class="social-button youtube" href="https://www.youtube.com/" target="_blank"><i class="fa fa-youtube-play"></i></a>
                    <a class="social-button instagram" href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
        </div>

        <div class="foot-end">
            <p>© 2020 Công ty TNHH adidas Việt Nam</p>
        </div>

    </footer>

</body>

<script>
    // let video = document.querySelector(".video-trailer");
    // const videoSituation = document.querySelector(".playPause");
    // const videoVolume = document.querySelector(".mute");


    


    // function playPause() {
    //     if (video.paused) {
    //         videoSituation.innerHTML = `<i class="situation-video fa fa-pause " aria-hidden="true"></i>`;

    //         video.play();
    //     } else {
    //         videoSituation.innerHTML = `<i class="situation-video fa fa-play " aria-hidden="true"></i>`;

    //         video.pause();
    //     }
    // }

    // function volume() {
    //     video.muted = !video.muted;
    //     videoVolume.classList.toggle("muted");
    // }
</script>
<script src="../js/video_Control.js"></script>
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