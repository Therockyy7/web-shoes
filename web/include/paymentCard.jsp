

<%@page import="model.Products"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay by card </title>
        <link rel="stylesheet" href="style/paymentCard.css">
    </head>
    <body>
        <div class="container">
            <form action="PaymentServlet" method="post">

                <div class="card cart">
                    <label class="title">PAYMENT BY CARD</label>
                    <div class="steps">
                        <div class="step">
                            <div>
                                <span>SHIPPING</span>
                                <p name="userName">User name: ${userName}</p>
                                <p>Email: ${email}</p>
                                <p>Phone: ${phone}</p>
                                <p>Address 1: ${address}</p>
                                <p>Address 2: ${address2}</p>
                                <p>Country: ${country}</p>
                                <p>Zip: ${zip}</p>

                            </div>
                            <hr />
                            <div>
                                <span>CARD INFORMATION</span>
                                <div class="form">
                                    <input
                                        type="text"
                                        name="Type"
                                        placeholder="Enter type (Credit/Debit)"
                                        class="input_field"
                                        value=""
                                        required
                                        />
                                    <input
                                        type="text"
                                        name="CardNumber"
                                        placeholder="Enter card number"
                                        class="input_field"
                                        required
                                        />
                                    <input
                                        type="text"
                                        name="Expiration"
                                        placeholder="Enter expiration"
                                        class="input_field"
                                        required

                                        />
                                    <input
                                        type="text"
                                        name="Cvv"
                                        placeholder="Enter CVV"
                                        class="input_field"
                                        required
                                        />
                                </div>
                            </div>
                            <hr />
                            <div class="promo">
                                <span>HAVE A PROMO CODE?</span>
                                <div class="form">
                                    <input
                                        type="text"
                                        placeholder="Enter a Promo Code"
                                        class="input_field"
                                        />
                                    <button>Apply</button>
                                </div>
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
//                event.preventDefault();
                alert('Đơn hàng đã bị hủy!');
                window.location.href = 'ShowAddToBag?action=showBag';
            }
        </script>


    </body>
</html>

<!--<hr class="mb-4">-->
<!--<h4 class="mb-3">Payment</h4>

        <div class="d-block my-3">
            <div class="custom-control custom-radio">
                <input id="credit" name="cardType" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credit">Credit card</label>
            </div>
            <div class="custom-control custom-radio">
                <input id="debit" name="cardType" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debit">Debit card</label>
            </div>
                                        <div class="custom-control custom-radio">
                                          <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                          <label class="custom-control-label" for="paypal">PayPal</label>
                                        </div>
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
        <button class="btn btn-primary btn-lg btn-block" type="submit">PAY</button>-->