<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Products"%>
<%@page import="model.ProductsDB"%>
<%
    // Get productID from the request
    int productId = Integer.parseInt(request.getParameter("productID"));
    
    // Fetch product details from the database based on productID
    Products product = ProductsDB.getProductById(productId);
    
    // Split the image URLs
    String[] url = product.getImageURL().split(";");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vike Online - Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />
        <link rel="shortcut icon" href="../image/logo/logoShop.png" type="image/x-icon">
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../style/header.css">
        <link rel="stylesheet" href="../style/middle.css"> 
        <link rel="stylesheet" href="../style/adminStyle.css">
        <link rel="stylesheet" href="../style/adminTable.css">
    </head>
    <body>
        <div class="header">
            <div class="navbar">
                <div class="container">
                    <div class="left-section">
                        <div id="userPanel" class="user-panel">
                            <a href="javascript:void(0);" id="userIcon" onclick="toggleUserInfo()">
                                <img class="icon-head" src="../icons/user.png" alt="#">
                            </a>
                            <div id="userInfo" class="user-info">
                                <table>
                                    <tr>
                                        <td>${sessionScope.user.username}</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="LogoutServlet?value=admin" class="logout-link">
                                                <img class="icon-logout" src="../icons/logout.png" alt="Logout Icon">
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div>
                    <div class="middle-section">
                        <nav>
                            <p>ADMIN</p>
                        </nav>
                    </div>
                    <div class="right-section">
                        <a href="adminPage.jsp">
                            <img class="icon-head" src="../icons/back.png" alt="#">
                        </a>                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content Section -->
        <div class="container mt-5">
            <h2>Update Product</h2>
            <form action="managementProduct" method="post">
                <input type="hidden" name="action" value="updateProduct">
                <input type="hidden" name="productId" value="<%= (product != null ? product.getProductID() : "") %>">

                <label for="productName">Product Name:</label><br>
                <input type="text" id="productName" name="newProductName" value="<%= (product != null ? product.getName() : "") %>" required><br><br>

                <label for="brand">Brand:</label><br>
                <input type="text" id="brand" name="newBrand" value="<%= (product != null ? product.getBrand() : "") %>" required><br><br>

                <label for="categoryID">Category ID:</label><br>
                <input type="number" id="categoryID" name="newCategoryID" value="<%= (product != null ? product.getCategoryID() : "") %>" required><br><br>

                <label for="price">Price:</label><br>
                <input type="number" step="0.01" id="price" name="newPrice" value="<%= (product != null ? product.getPrice() : "") %>" required><br><br>

                <label for="description">Description:</label><br>
                <textarea id="description" name="newDescription" required><%= (product != null ? product.getDescription() : "") %></textarea><br><br>

                <label for="imageURL">Image URL 1:</label><br>
                <input type="text" id="imageURL" name="newImageURL1" value="<%= (product != null ? url[0] : "") %>" required><br><br>

                <label for="imageURL">Image URL 2:</label><br>
                <input type="text" id="imageURL" name="newImageURL2" value="<%= (product != null ? url[1] : "") %>" required><br><br>

                <label for="imageURL">Image URL 3:</label><br>
                <input type="text" id="imageURL" name="newImageURL3" value="<%= (product != null ? url[2] : "") %>" required><br><br>

                <label for="imageURL">Image URL 4:</label><br>
                <input type="text" id="imageURL" name="newImageURL4" value="<%= (product != null ? url[3] : "") %>" required><br><br>

                <label for="stockQuantity">Stock Quantity:</label><br>
                <input type="number" id="stockQuantity" name="newStockQuantity" value="<%= (product != null ? product.getStockQuantity() : "") %>" required><br><br>

                <label for="manufacturerID">Manufacturer ID:</label><br>
                <input type="number" id="manufacturerID" name="newManufacturerID" value="<%= (product != null ? product.getManufacturerID() : "") %>" required><br><br>

                <label for="size">Size:</label><br>
                <input type="text" id="size" name="newSize" value="<%= (product != null ? product.getSize() : "") %>" required><br><br>

                <label for="gender">Gender:</label><br>
                <input type="text" id="gender" name="newGender" value="<%= (product != null ? product.getGender() : "") %>" required><br><br>

                <button type="submit" class="update-product-button">Update Product</button>
            </form>
        </div>

        <style>
            form {
                display: flex;
                flex-direction: column;
            }

            label {
                font-weight: bold;
                margin-bottom: 8px;
            }

            input[type="text"],
            input[type="number"],
            textarea {
                padding: 8px;
                margin-bottom: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                width: calc(100% - 16px);
            }

            button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 10px;
                cursor: pointer;
                border-radius: 4px;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>

        <!-- JavaScript Section -->
        <script>
            // Function to toggle user information panel
            function toggleUserInfo() {
                var userInfo = document.getElementById("userInfo");
                if (userInfo.style.display === "none" || userInfo.style.display === "") {
                    userInfo.style.display = "block";
                } else {
                    userInfo.style.display = "none";
                }
            }

            // Event listener to close user information panel when clicking outside
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
    </body>
</html>
