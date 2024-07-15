

<%@page import="model.Products"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm</title>
        <link rel="stylesheet" href="style/paymentCard.css"/>
    </head>
    <body>  
        <div class="container">
            <form action="SendEmailOrder" method="post">

                <div class="card cart">
                    <label class="title">PAYMENT ON DELIVERED</label>
                    <div class="steps">
                        <div class="step">
                            <div>
                                <span>SHIPPING</span>
                                <p>User name: ${userName}</p>
                                <p>Email: ${email}</p>
                                <p>Phone: ${phone}</p>
                                <p>Address 1: ${address}</p>
                                <p>Address 2: ${address2}</p>
                                <p>Country: ${country}</p>
                                <p>Zip: ${zip}</p>

                            </div>
                            <hr />

                            <div class="payments">
                                <span>LIST PRODUCT</span>
                                <div class="details">
                                    <% double totalPrice = 0.0; %>
                                    <%
                                        Map<Products, String> mapProduct = (Map<Products, String>) session.getAttribute("mapProduct");
                                        if (mapProduct != null && !mapProduct.isEmpty()) {
                                            for (Map.Entry<Products, String> entry : mapProduct.entrySet()) {
                                                Products product = entry.getKey();
                                                String productName = product.getName();
                                                double price = product.getPrice();
                                                int size = Integer.parseInt(entry.getValue());
                                                totalPrice += price;
                                    %>
                                    <span>Product name:</span>
                                    <span><%= productName%></span>
                                    <span>Price:</span>
                                    <span><%= String.format("%.0f", price) + " VND"%></span>
                                    <span>Size:</span>
                                    <span><%= size%></span>
                                    <% }
                                        }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card checkout">
                    <div class="footer">
                        <label class="price">Total: <%= String.format("%.0f", totalPrice) + " VND"%></label>
                        <button type="submit" name="action" value="confirm" class="checkout-btn">PAY</button>
                        <button class="checkout-btn" onclick="cancelOrder()">Cancel</button>

                    </div>
                </div>
            </form>

        </div>

        <script>
            function cancelOrder() {
                alert('Đơn hàng đã bị hủy!');
                window.location.href = 'ShowAddToBag?action=showBag';
            }
        </script>
    </body>
</html>