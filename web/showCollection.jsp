<%-- 
    Document   : showCollection
    Created on : Jul 14, 2024, 11:28:35 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import="model.CollectionProducts" %>
<!DOCTYPE html>
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
                            <a href="include/sigin.jsp">
                                <img class="icon-head" src="icons/user.png" alt="#">
                            </a>
                            <a href="include/wishList.jsp">
                                <img class="icon-head" src="icons/love-hand-drawn-heart-symbol-outline.png" alt="#">
                            </a>
                            <div class="notification-item">
                                <a href="ShowAddToBag?action=showBag">
                                    <div class="shopBag-container">
                                        <img class="icon-head" src="icons/shopping-bag.png" alt="#">
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
                
            </div>

        </div>
    
         <div class="tab-content pt-5" id="tab-content">
            <div class="tab-pane active" id="fill-tabpanel-0" role="tabpanel" aria-labelledby="fill-tab-0">
                <div class="row row-cols-1 row-cols-md-4 g-4 card-container">
                    
                       
                     <%
                          
                                ArrayList<CollectionProducts> list = (ArrayList<CollectionProducts>) request.getAttribute("products");
                                
                                
                                for(CollectionProducts item : list){
                                    String[] url = item.getImageURL().split(";");
                                    double price = item.getPrice();
                                    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                                    String formattedPrice = formatter.format(price);
                            %>

                                <!-- <div class="col"> -->
                                <div class="card uk-card uk-card-hover">
                                    <a  class="text-decoration-none text-dark" href="collectionDetails?productID=<%= item.getProductID() %>">
                                        <img src="<%= url[0] %> " class="card-img-top" alt="...">
                                        <div class="card-footer bg-dark rounded-bottom text-center">
                                            <small class="text-light fw-semibold "><%= formattedPrice %></small>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title "><%= item.getName() %></h5>
                                            <p class="card-text"><%= item.getDescription() %></p>
                                        </div>
                                    </a>                    
                                </div>
                                <!-- </div> -->

                            
                            
                            <%
                                }
                            %>
           
                      
                    
                </div>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>