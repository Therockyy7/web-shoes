<%-- 
    Document   : shopBag
    Created on : Jun 22, 2024, 6:36:19 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Products"%>
<%@page import="model.Promotion"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your BAG</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  <!-- UIkit CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />

    <link rel="shortcut icon" href="image/logo/logoSHop.png" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="style/header.css">
    <link rel="stylesheet" href="style/tabs.css">
    <link rel="stylesheet" href="style/wishLish.css">

    
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
                    <a href="index.jsp">
                        <img src="image/logo/logoSHop.png" alt="#">
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
            <div class="tab"><a class="tab-index" href="index.html">TRANG CHỦ</a></div>
            <div class="tab"><a href="include/nam.jsp">Giày Nam</a></div>|
            <div class="tab"><a href="include/nu.jsp">Giày Nữ</a></div>|
            <div class="tab"><a href="include/newArrival.jsp">New arrivals</a></div>
        </div>
    </div>
<!-- --------------------- -->
    <div class="showItem">
        <div class="container-listProduct">
            <div class="row card-container">
                  
                    
                <%
                    Map<Products,String> mapProduct = (Map<Products,String>) session.getAttribute("mapProduct");
                    
                    if(mapProduct == null || mapProduct.isEmpty()){
     
    %>
                            <div> Không có sản phẩm nào</div>
    
    <%
                    }else{
    
    
                    %>
    
    
                    <%    
                        for(Map.Entry<Products,String> item : mapProduct.entrySet()){
                            String[] url = item.getKey().getImageURL().split(";");
                            double price = item.getKey().getPrice();
                            NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                            String formattedPrice = formatter.format(price);
                    %>
                        <div class="col-md-3 col-sm-6 card">
                            <div class="product-grid">
                                <div class="product-image">
                                    <a href="#" class="image">
    
                                        <img class="pic-1" src="<%= url[0]%>">
                                        <img class="pic-2" src="<%= url[1]%>">
                                    </a>
    
    
                                    <ul class="product-links">
                                        <li><a href="AllServlet?id=<%= item.getKey().getProductID() %>&action=showItem"><i class="fa fa-search"></i></a></li>
                                        <li><a><%= item.getValue() %></a></li>
    
                                    </ul>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#"><%= item.getKey().getName() %></a></h3>
                                    <div class="price"><%= formattedPrice %></div>
                                </div>
                                <a href="ShowAddToBag?id=<%= item.getKey().getProductID() %>&action=delete" class="btn btn-primary">Delete</a>
                            </div>
                        </div>
                    <%
                        }
                    %>
            
                <%
                    }
                %>
                
                
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
        
        <!--<div class="showPrice">-->
            <div class="container">
                <div class="py-5 text-center">
                  
                  <h2>Checkout form</h2>
                  <p class="lead">Please confirm your information before doing the next steps.</p>
                </div>
              
                <div class="row">
                  <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                      <span class="text-muted">Your cart</span>
                      <span class="badge badge-secondary badge-pill">3</span>
                    </h4>
                    <ul class="list-group mb-3">
                        
                     <% 
                        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                        double totalPrice = 0;
                        for(Map.Entry<Products,String> item : mapProduct.entrySet()){
                            String[] url = item.getKey().getImageURL().split(";");
                            double price = item.getKey().getPrice();
                            totalPrice = totalPrice + price;
                            
                            String formattedPrice = formatter.format(price);
                    %>
                        
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                          <div>
                            <h6 class="my-0"><%= item.getKey().getName() %></h6>
                            <small class="text-muted"><%= item.getKey().getDescription() %></small>
                          </div>
                          <span class="text-muted"><%= formattedPrice %></span>
                        </li>
                       
                      <%
                          }
                      %>
                      
                      <%
                          int discount = 0;
                          Promotion promotion = (Promotion)request.getAttribute("promotion");
                          if(promotion != null){
                      %>
                       <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                          <h6 class="my-0">Promo code</h6>
                          <small>${promotion.code}</small>
                        </div>
                        <p style="color: red;
                                  font-size: 20px;">
                            <%= promotion.getDiscountPercentage()%>%
                        </p>
                        <%
                            discount = ((int)totalPrice * promotion.getDiscountPercentage()) / 100 ;
                            String formattedDiscount = formatter.format(discount);
                        %>
                        <span class="text-success">-<%= formattedDiscount%></span>
                      </li>
                      
                      <%
                          }
                      %>
                     
                      
                      <li class="list-group-item d-flex justify-content-between">
                        <span>Total (VNĐ)</span>
                        <%
                        
                        int finalPrice = (int)totalPrice - discount;
                        String formattedFinalPrice = formatter.format(finalPrice);
                        %>
                        <strong><%= formattedFinalPrice %></strong>
                      </li>
                    </ul>
              
                      <%
                      String msg = (String)request.getAttribute("msg");
                      
                      if(msg != null){
                      %>
                      <form action="PromotionServlet" method="get" class="card p-2">
                          <input type="hidden" name="action" value="confirmCode" />
                          <div class="input-group">
                              <div style="color: red;
                                        font-size: 12px;" class="mess">
                                  <%= msg %>
                              </div>
                              <input type="text" class="form-control" name="code" placeholder="Promo code">
                              <div class="input-group-append">
                                  <button type="submit" class="btn btn-secondary">Redeem</button>
                              </div>
                          </div>
                      </form>
                      
                      <%
                          }else{
                      %>
                      <form action="PromotionServlet" method="get" class="card p-2">
                          <input type="hidden" name="action" value="confirmCode" />
                          <div class="input-group">
                              
                              <input type="text" class="form-control" name="code" placeholder="Promo code">
                              <div class="input-group-append">
                                  <button type="submit" class="btn btn-secondary">Redeem</button>
                              </div>
                          </div>
                      </form>
                      <%
                          }
                      %>
                    
                  </div>
                  <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Billing address</h4>
                    
                    <form action="CheckOutServlet" method="get" class="needs-validation" novalidate>
                          <div class="row">
                            <div class="col-md-6 mb-3">
                              <label for="firstName">First name</label>
                              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                              <div class="invalid-feedback">
                                Valid first name is required.
                              </div>
                            </div>
                            <div class="col-md-6 mb-3">
                              <label for="lastName">Last name</label>
                              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                              <div class="invalid-feedback">
                                Valid last name is required.
                              </div>
                            </div>
                          </div>

                          <div class="mb-3">
                            <label for="username">Username</label>
                            <div class="input-group">
                              <div class="input-group-prepend">
                                <span class="input-group-text">@</span>
                              </div>
                              <input type="text" class="form-control" id="username" placeholder="Username" required>
                              <div class="invalid-feedback" style="width: 100%;">
                                Your username is required.
                              </div>
                            </div>
                          </div>

                          <div class="mb-3">
                            <label for="email">Email <span class="text-muted">(Optional)</span></label>
                            <input type="email" class="form-control" id="email" placeholder="you@example.com">
                            <div class="invalid-feedback">
                              Please enter a valid email address for shipping updates.
                            </div>
                          </div>

                          <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                            <div class="invalid-feedback">
                              Please enter your shipping address.
                            </div>
                          </div>

                          <div class="mb-3">
                            <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                            <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                          </div>

                          <div class="row">
                            <div class="col-md-5 mb-3">
                              <label for="country">Country</label>
                              <select class="custom-select d-block w-100" id="country" required>
                                <option value="">Choose...</option>
                                <option>Hà Nội</option>
                                <option>Hải Phòng</option>
                                <option>Đà Nẵng</option>
                                <option>Hồ Chí Minh</option>
                                <option>Cần Thơ</option>
                                <option>An Giang</option>
                                <option>Bà Rịa – Vũng Tàu</option>
                                <option>Bạc Liêu</option>
                                <option>Bắc Giang</option>
                                <option>Bắc Kạn</option>
                                <option>Bắc Ninh</option>
                                <option>Bến Tre</option>
                                <option>Bình Dương</option>
                                <option>Bình Định</option>
                                <option>Bình Phước</option>
                                <option>Bình Thuận</option>
                                <option>Cà Mau</option>
                                <option>Cao Bằng</option>
                                <option>Đắk Lắk</option>
                                <option>Đắk Nông</option>
                                <option>Điện Biên</option>
                                <option>Đồng Nai</option>
                                <option>Đồng Tháp</option>
                                <option>Gia Lai</option>
                                <option>Hà Giang</option>
                                <option>Hà Nam</option>
                                <option>Hà Tĩnh</option>
                                <option>Hải Dương</option>
                                <option>Hậu Giang</option>
                                <option>Hòa Bình</option>
                                <option>Hưng Yên</option>
                                <option>Khánh Hòa</option>
                                <option>Kiên Giang</option>
                                <option>Kon Tum</option>
                                <option>Lai Châu</option>
                                <option>Lâm Đồng</option>
                                <option>Lạng Sơn</option>
                                <option>Lào Cai</option>
                                <option>Long An</option>
                                <option>Nam Định</option>
                                <option>Nghệ An</option>
                                <option>Ninh Bình</option>
                                <option>Ninh Thuận</option>
                                <option>Phú Thọ</option>
                                <option>Phú Yên</option>
                                <option>Quảng Bình</option>
                                <option>Quảng Nam</option>
                                <option>Quảng Ngãi</option>
                                <option>Quảng Ninh</option>
                                <option>Quảng Trị</option>
                                <option>Sóc Trăng</option>
                                <option>Sơn La</option>
                                <option>Tây Ninh</option>
                                <option>Thái Bình</option>
                                <option>Thái Nguyên</option>
                                <option>Thanh Hóa</option>
                                <option>Thừa Thiên Huế</option>
                                <option>Tiền Giang</option>
                                <option>Trà Vinh</option>
                                <option>Tuyên Quang</option>
                                <option>Vĩnh Long</option>
                                <option>Vĩnh Phúc</option>
                                <option>Yên Bái</option>
                              </select>
                              <div class="invalid-feedback">
                                Please select a valid country.
                              </div>
                            </div>
<!--                            <div class="col-md-4 mb-3">
                              <label for="state">State</label>
                              <select class="custom-select d-block w-100" id="state" required>
                                <option value="">Choose...</option>
                                <option>California</option>
                              </select>
                              <div class="invalid-feedback">
                                Please provide a valid state.
                              </div>
                            </div>-->
                            <div class="col-md-3 mb-3">
                              <label for="zip">Zip</label>
                              <input type="text" class="form-control" id="zip" placeholder="" required>
                              <div class="invalid-feedback">
                                Zip code required.
                              </div>
                            </div>
                          </div>
                          <hr class="mb-4">
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="same-address">
                            <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="save-info">
                            <label class="custom-control-label" for="save-info">Save this information for next time</label>
                          </div>
                          <hr class="mb-4">

                          <h4 class="mb-3">Payment</h4>

                          <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                              <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                              <label class="custom-control-label" for="credit">Credit card</label>
                            </div>
                            <div class="custom-control custom-radio">
                              <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                              <label class="custom-control-label" for="debit">Debit card</label>
                            </div>
<!--                            <div class="custom-control custom-radio">
                              <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                              <label class="custom-control-label" for="paypal">PayPal</label>
                            </div>-->
                          </div>
                          <div class="row">
                            <div class="col-md-6 mb-3">
                              <label for="cc-name">Name on card</label>
                              <input type="text" class="form-control" id="cc-name" placeholder="" required>
                              <small class="text-muted">Full name as displayed on card</small>
                              <div class="invalid-feedback">
                                Name on card is required
                              </div>
                            </div>
                            <div class="col-md-6 mb-3">
                              <label for="cc-number">Credit card number</label>
                              <input type="text" class="form-control" id="cc-number" placeholder="" required>
                              <div class="invalid-feedback">
                                Credit card number is required
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-3 mb-3">
                              <label for="cc-expiration">Expiration</label>
                              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                              <div class="invalid-feedback">
                                Expiration date required
                              </div>
                            </div>
                            <div class="col-md-3 mb-3">
                              <label for="cc-cvv">CVV</label>
                              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                              <div class="invalid-feedback">
                                Security code required
                              </div>
                            </div>
                          </div>
                          <hr class="mb-4">
                          <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                        </form>
                  </div>
                </div>
              
                <footer class="my-5 pt-5 text-muted text-center text-small">
                  <p class="mb-1">&copy; 2017-2019 Company Name</p>
                  <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">Privacy</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Support</a></li>
                  </ul>
                </footer>
              </div>
<!--        </div>-->
    </div>
    <script>
      
        let wishList = JSON.parse(localStorage.getItem('wishList')) || [];
        document.querySelector('.js-wishList-quantity').innerHTML = wishList.length;
        
        let bag = JSON.parse(localStorage.getItem('bag')) || [];
        document.querySelector('.js-bag-quantity').innerHTML = bag.length;
    </script>

     <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/js/uikit-icons.min.js"></script>
    <!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    
     <script src="js/pagination_all.js"></script>
     </body>


  
</html>
