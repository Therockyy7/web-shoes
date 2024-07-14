<%-- 
    Document   : confirmOrder
    Created on : Jul 11, 2024, 10:33:39 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Checkout</title>
        <link rel="stylesheet" href="style/confirmOrder.css">
    </head>
    <body>
        <div class="bg">
  
            <div class="card">
              
              <span class="card__success"><i class="fa fa-check" aria-hidden="true"></i></span>
              
              <h1 class="card__msg">Payment Complete</h1>
              <h2 class="card__submsg">Thank you </h2>
              
              <div class="card__body">
                
                <!-- <img src="http://nathgreen.co.uk/assets/img/nath.jpg" class="card__avatar"> -->
                <div class="card__recipient-info">
                  <p class="card__email">Hello <br> <h2>${name}</h2></p>
                  <p class="card__recipient">${email}</p>
                </div>
               
                
              </div>
              
              <div class="btn_place">
                <a href="AllServlet?action=listAll" class="btn btn-primary">Continue purchase</a>
                <a href="index.jsp" class="btn btn-primary">Back</a>
              </div>
              
            </div>
            
        </div>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
