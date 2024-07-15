

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
            <form action="PaymentServlet" method="post">

                <div class="card cart">
                    <label class="title">PAYMENT ON DELIVERED</label>
                    <div class="steps">
                        <div class="step">
                            <div>
                                <span>SHIPPING</span>
                                <p>User name: <input name="userNameP" value="${userName}"style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;"/></p>
                                <p>Email: <input name="emailP" value="${email}" style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;"/></p>
                                <p>Phone: <input name="phoneP" value="${phone}"style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;"/></p>
                                <p>Address 1:<input name="addressP" value="${address}"style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;"/> </p>
                                <p>Address 2: <input name="addressP2" value="${address2}" style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;"/></p>
                                <p>Country: <input name="countryP" value="${country}"style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;" /></p>
                                <p>Zip:<input name="zipP" value="${zip}"style="border: none; background-color: transparent; color: #000000; font-size: 13px; font-weight: 600;" /></p>


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