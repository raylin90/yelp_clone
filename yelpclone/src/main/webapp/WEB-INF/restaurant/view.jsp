<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${oneRestaurant.name}</title>
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
                    <a class="btn btn-primary" href="">Login</a>
                    <a class="btn btn-outline-success me-3" href="">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="position-relative text-light">
        <img src="/images/adv2.png" alt="main adv." class="rounded" style="height: 70vh; width:100vw; object-fit: cover;">
        <form class="position-absolute" style="top: 43vh; left: 20vw">
            <h1 class="fs-1 fw-bold">${oneRestaurant.name}</h1>
            <h3>rating</h3>
            <h3 class="fs-6">${oneRestaurant.category}</h3>
        </form>
    </div>

    <div class="container mt-4">
        <a class="btn btn-primary" href="">Write a Review</a>
        <a class="btn btn-info" href="">Edit</a>
    </div>
</body>
</html>