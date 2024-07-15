<!DOCTYPE html>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <link rel="stylesheet" href="../style/middle-poster.css">
        <link rel="stylesheet" href="../style/list-color.css">      
        <link rel="stylesheet" href="../style/adminStyle.css">
    </head>
    <body>
        <!-- Header -->
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
                    <div class="middle-section ">
                        <nav>
                            <p>ADMIN</p>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card text-center">
                        <div class="card-body">
                            <a href="userManagement.jsp" class="btn btn-outline-primary btn-lg">User</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-center">
                        <div class="card-body">
                            <a href="productManagement.jsp" class="btn btn-outline-primary btn-lg">Sản phẩm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <a href="viewHistoryOrder.jsp" class="btn btn-outline-primary btn-lg">Lịch sử mua hàng</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <a href="viewTopSale.jsp" class="btn btn-outline-primary btn-lg">Sản phẩm bán chạy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Panel user
            function toggleUserInfo() {
                var userInfo = document.getElementById("userInfo");
                if (userInfo.style.display === "none" || userInfo.style.display === "") {
                    userInfo.style.display = "block";
                } else {
                    userInfo.style.display = "none";
                }
            }

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
