<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Restaurants By Category</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="short cut icon" type="image/png" href="/images/favicon.png">
<link rel="stylesheet" href="/css/rating.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/footer.css">
</head>

<body style="height: 100%">
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
                <!-- navbar search and submit -->
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-6">

                <c:set var = "count" value = "${count}"/>
                <c:if test = "${count == 0}">
                    <h3 class=text-danger>0 Result</h3>
                </c:if>
                <c:if test = "${count == 1}">
                    <h3 class="d-inline-block">1 Result: </h3>
                </c:if>
                <c:if test = "${count > 1}">
                    <h3 class="d-inline-block">${count} Results: </h3>
                </c:if>
                <c:forEach items='${allRestaurants}' var='restaurant'>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="/images/adv2.png" class="img-fluid rounded-start" alt="restaurant picture">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${restaurant.name}</h5>
                                    <p class="card-text">
                                        <div class="ratings d-inline-block">
                                            <div class="empty-stars"></div>
                                            <div class="full-stars" style="--percentage: <c:out value='${restaurant.reviewOverallRating}'/>;"></div>
                                        </div>
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
                                    </p>
                                    <p class="card-text"><small class="text-muted">${restaurant.category}</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <p id="footer" class="fw-lighter text-center">Responsive Yelp Clone Web Application</p>
</body>
</html>