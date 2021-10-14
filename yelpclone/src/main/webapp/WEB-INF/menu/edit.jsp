<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${oneRestaurant.name} - Edit Menu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="short cut icon" type="image/png" href="/images/favicon.png">
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
                        <li><a class="dropdown-item" href="#">Write a Review</a></li>
                        <li><hr class="dropdown-divider"></li>
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
            <div class="col-8">
                <h3>Edit Menu ${menu.title}</h3>

                <form action='/update/restaurant/${oneRestaurant.id}/menus/${menu.id}' method='post' enctype='multipart/form-data'>
                <p>
                    <label class="form-label" for='title'>Menu title: </label>
                    <input class="form-control" name='title' value=${menu.title} required/>
                </p>
                <p>
                    <label class="form-label" for='description'>Description: </label>
                    <textarea cols="30" rows="10" name='description' class="form-control" placeholder="Enter description..." required>${menu.description}</textarea>
                </p>
                <p>
                    <label class="form-label" for='price' >Price: $$$</label>
                    <input class="form-control" name='price' value=${menu.price} required/>
                </p>
                <p>
                    <label class="form-label" for='image_url'>Image: </label>
                    <input type="file" class="form-control" name='image_url' value=${menu.image_url}/>
                </p>
                <input class="btn btn-secondary" type='submit' value='Update'/>
                <p class="text-danger">${message}</p>
                </form>
            </div>

            <div class="col-4">
                <a href="/create/menu/restaurant/${oneRestaurant.id}">Want to Create a Menu?</a>
                <div class="info border rounded p-3 mt-2">
                    <a class="d-block" href=${oneRestaurant.webAddress}>${oneRestaurant.webAddress}</a>
                    <hr>
                    <h5 class="mt-2">${oneRestaurant.phone}</h5>
                    <hr>
                    <p class="text-secondary">${oneRestaurant.address1} ${oneRestaurant.address2} ${oneRestaurant.city}, ${oneRestaurant.state}, ${oneRestaurant.zipCode}</p>
                </div>
            </div>
        </div>
    </div>


</body>
</html>