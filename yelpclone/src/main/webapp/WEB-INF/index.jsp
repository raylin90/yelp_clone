<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yum!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="short cut icon" type="image/png" href="/images/favicon.png">
<link rel="stylesheet" href="/css/rating.css">
<link rel="stylesheet" href="/css/footer.css">
</head>

<body>
    <!-- "navbar-expand-lg" define how fast will navbar collapse -->
    <nav class="navbar navbar-expand-sm navbar-light " style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><img src="/images/logo.png" alt="logo.png" class="rounded-circle" style="width: 50px;"></a>
            <!-- hiddden button when window collapse -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- navbar button and link -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/">Home</a>
                    </li>
                    <!-- navbar drop down link -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Action
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/create/restaurant">Create a Restaurant</a></li>
                        </ul>
                    </li>
                </ul>
                <div>
                    <!-- display login/register/logout button base on whether user login or not -->
                    <c:set var = "isUserLogin" value = "${isUserLogin}"/>
                    <c:choose>
                    <c:when test="${isUserLogin == true}">
                        <a class="btn btn-danger" href="/logout">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-primary" href="/login">Login</a>
                        <a class="btn btn-outline-success" href="/register">Sign Up</a>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- advertise pivture and search bar -->
    <div class="text-center position-relative">
        <img src="/images/adv2.png" alt="main adv." class="img-fluid rounded">
        <form action="/search" class="d-flex position-absolute bottom-50 end-50">
            <input class="form-control me-2" name="word" type="search" placeholder="Search Restaurant" aria-label="Search" style="width: 30vw; max-width: 700px;">
            <button class="btn btn-outline-info" type="submit">Search</button>
        </form>
    </div>

    <!-- main content -->
    <div class="container mt-5">
        <h4 class="text-center">Top Restaurant by Cuisine Type:</h4>
        <br>
        <div class="categories d-flex justify-content-between">
            <a href="/show/restaurant/by/category/fine dining" class="text-secondary text-decoration-none">Fine Dining</a>
            <a href="/show/restaurant/by/category/casual dining" class="text-secondary text-decoration-none">Casual Dining</a>
            <a href="/show/restaurant/by/category/family style" class="text-secondary text-decoration-none">Family Style</a>
            <a href="/show/restaurant/by/category/fast food" class="text-secondary text-decoration-none">Fast Food</a>
            <a href="/show/restaurant/by/category/food truck, cart, or stand" class="text-secondary text-decoration-none">Food Truck, Cart, Or Stand</a>
            <a href="/show/restaurant/by/category/buffet" class="text-secondary text-decoration-none">Buffet</a>
            <a href="/show/restaurant/by/category/pub" class="text-secondary text-decoration-none">Pub</a>
            <a href="/show/restaurant/by/category/barbecue grill" class="text-secondary text-decoration-none">Barbecue Grill</a>
        </div>
        <hr>
        <div class="content d-flex justify-content-center flex-wrap">
            <c:forEach items='${allRestaurants}' var='restaurant'>
                <div class="card m-3" style="width: 18rem;">
                    <img src="/images/adv2.png" class="card-img-top" alt="card img">
                    <div class="card-body">
                        <h5 class="card-title overflow-hidden text-truncate"><a href="/view/restaurant/${restaurant.id}">${restaurant.name}</a></h5>
                        <p class="card-text m-0">${restaurant.category}</p>
                        <p class="card-text text-truncate">${restaurant.city}, ${restaurant.state}</p>
                        <div class="ratings d-inline-block">
                            <div class="empty-stars"></div>
                            <div class="full-stars" style="--percentage: <c:out value='${restaurant.reviewOverallRating}'/>;"></div>
                        </div>
                        <!-- display review count singular or plural base on number -->
                        <c:set var = "count" value = "${restaurant.reviewOverallCount}"/>
                        <c:if test = "${count == 0}">
                            <p class="d-inline-block">0 review</p>
                        </c:if>
                        <c:if test = "${count == 1}">
                            <p class="d-inline-block"><fmt:formatNumber value="${restaurant.reviewOverallCount}" minFractionDigits="0" maxFractionDigits="0"/> review</p>
                        </c:if>
                        <c:if test = "${count > 1}">
                            <p class="d-inline-block"><fmt:formatNumber value="${restaurant.reviewOverallCount}" minFractionDigits="0" maxFractionDigits="0"/> reviews</p>
                        </c:if>
                        <a href="/create/review/restaurant/${restaurant.id}" class="btn btn-outline-success btn-sm">write a review?</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <p id="footer" class="fw-lighter text-center">Responsive Yelp Clone Web Application</p>
</body>
</html>