<%-- 
    Document   : all
    Created on : Jun 22, 2024, 6:35:15 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>Tất cả sản phẩm</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  <!-- UIkit CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />


    <link rel="shortcut icon" href="../image/logo/logoSHop.png" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../style/header.css">
    <link rel="stylesheet" href="../style/header-video-trailer.css">
    <link rel="stylesheet" href="../style/tabs.css">
    
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
                        <i class="fa fa-chevron-down" ></i>
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
                            <i class="fa fa-times" ></i>
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
                    <a href="../index.jsp">
                        <img src="../image/logo/logoSHop.png" alt="#">
                    </a>
                </div>
                <div class="middle-section ">
                    <nav>
                        <ul>
                            <li><a href="nam.jsp">Nam</a></li>
                            <li><a href="nu.jsp">Nữ</a></li>
                            <li><a href="discount.jsp">Giảm giá</a></li>
                            <li><a href="all.jsp">Tất cả</a></li>
                        </ul>
                    </nav>

                </div>
                <div class="right-section">
                    <div class="container">
                        <div class="search-place">
                            <input class="search-bar" type="text" placeholder="Tìm kiếm">
                            <button type="submit" class="search-button">
                                <img class="search-icon" src="../icons/search.svg" alt="#">
                            </button>
                        </div>
                        <a href="sigin.jsp">
                            <img class="icon-head" src="../icons/user.png" alt="#">
                        </a>
                        <a href="wishList.jsp">
                            <img class="icon-head" src="../icons/love-hand-drawn-heart-symbol-outline.png" alt="#">
                        </a>
                        <div class="notification-item">
                            <a href="shopBag.jsp">
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
    <!-- ---------- -->
     <!-- Tabs navs -->
    <div class="tabs-nav">
        <div class="container-tab">
            <div class="tab"><a class="tab-index" href="../index.jsp">TRANG CHỦ</a></div>
            <div class="tab"><a href="nam.jsp">Giày Nam</a></div>|
            <div class="tab"><a href="nu.jsp">Giày Nữ</a></div>|
            <div class="tab"><a href="newArrival.jsp">New arrivals</a></div>
        </div>
    </div>

    <!-- List item -->
     <div class="list-Item">
        <div class="list-tab row">
            <a class="col-sm border border-dark text-center text-light bg-dark bg-gradient" href="all.jsp">Tất cả giày</a>
            <a class="col-sm border border-dark text-center" href="newArrival.jsp">Hàng mới về</a>
            <a class="col-sm border border-dark text-center" href="newArrival.jsp"> Giày Sneaker</a>
        </div>

        <div class="tab-content pt-5" id="tab-content">
            <div class="tab-pane active" id="fill-tabpanel-0" role="tabpanel" aria-labelledby="fill-tab-0">
                <div class="row row-cols-1 row-cols-md-4 g-4 card-container">
                    <!-- <div class="col"> -->
                      <div class="card uk-card uk-card-hover">
                        <a  class="text-decoration-none text-dark" href="card.jsp">
                        <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title ">Card title</h5>
                          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        </div>
                      </a>                    
                    </div>
                    <!-- </div> -->
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                    <div class="card uk-card uk-card-hover">
                      <a  class="text-decoration-none text-dark" href="card.jsp">
                      <img src="../image/jordan.jpg" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title ">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </a>                    
                  </div>
                    
                      
                    
                </div>

                <nav class="pagination-page mt-5" aria-label="Page navigation example">
                    <ul class="pagination" id="pagination">
                      <li class="page-item">
                        <a class="page-link" id="prev" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <div class="list-page d-flex flex-row ">
                        <!-- <li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>
                        <li class="page-item"><a class="page-link" href="#" data-page="2">2</a></li>
                        <li class="page-item"><a class="page-link" href="#" data-page="3">3</a></li> -->
                        
                      </div>
                      <li class="page-item">
                        <a class="page-link" id="next" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                      
                    </ul>
                    <p id="page-numbers"></p> 
                </nav>
            </div>
            
          </div>
     </div>
     <!-- UIkit JS -->
     <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit-icons.min.js"></script>
    


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="../js/pagination_all.js"></script>
     </body>


  
</html>
