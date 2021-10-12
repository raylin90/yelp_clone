<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${oneRestaurant.name} - Create Review</title>
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
            <div class="col-6">
                <div class="header d-flex justify-content-between">
                    <h3>${oneRestaurant.name}</h3>
                    <!-- a tag trigger modal -->
                    <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="text-decoration-none text-success" href="#">Read review guidelines</a>
                </div>
            
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Content Guidelines</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h6>General Guidelines</h6>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, corporis sed veritatis omnis nesciunt debitis dolores, provident dolorum repellat cumque mollitia ad sequi, obcaecati sapiente rem suscipit et voluptate animi?
                                Omnis voluptate aliquam repellendus architecto quam magni eaque, facere cupiditate esse harum tempore ad magnam dignissimos, blanditiis quo inventore fuga maiores. Id iusto molestias quasi voluptates eius fugiat, pariatur aliquam.</p>
                                <ul>
                                    <li><span class="fw-bold">Relevance:</span> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius tenetur voluptas expedita quaerat reprehenderit, harum laudantium distinctio. Unde officia impedit velit distinctio inventore cupiditate pariatur laborum. Commodi placeat iusto corporis!</li>
                                    <li><span class="fw-bold">Inappropriate content:</span> Lorem ipsum dolor sit amet consectetur, adipisicing elit. In, eveniet asperiores</li>
                                    <li><span class="fw-bold">Conflicts of interest:</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur perspiciatis nisi deleniti sapiente quo ratione hic accusamus? Delectus quas harum rem, eveniet sunt totam molestias facilis.</li>
                                </ul>
                                <p class="text-danger">Thank you and Enjoy the website!</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <form:form action='#' method='post' modelAttribute='review'>
                <p>
                <form:label class="form-label" path='rating'>Rating</form:label>
                <form:input class="form-control" path='rating'/>
                <form:errors class="text-danger" path='rating'/>
                </p>
                <p>
                <form:label class="form-label" path='comment'>Comment</form:label>
                <form:textarea class="form-control" path='comment' cols="30" rows="10"></form:textarea>
                <form:errors class="text-danger" path='comment'/>
                </p>
                <p>
                <form:label class="form-label" path='pic_url'>Attach Photo</form:label>
                <form:input type="file" class="form-control" path='pic_url'/>
                <form:errors class="text-danger" path='pic_url'/>
                </p>
                <input class="btn btn-secondary" type='submit' value='Submit'/>
                </form:form>
            </div>
        </div>
    </div>

</body>
</html>