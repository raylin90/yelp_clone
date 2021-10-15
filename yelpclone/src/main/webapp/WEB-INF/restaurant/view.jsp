<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${oneRestaurant.name}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="short cut icon" type="image/png" href="/images/favicon.png">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                        <a class="nav-link dropdown-toggle" href="/write/a/review" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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

    <div class="position-relative text-light">
        <img src="/images/adv2.png" alt="main adv." class="rounded" style="height: 70vh; width:100vw; object-fit: cover;">
        <form class="position-absolute" style="top: 43vh; left: 20vw">
            <h1 class="fs-1 fw-bold">${oneRestaurant.name}</h1>
            <div class="ratings d-inline-block">
                <div class="empty-stars"></div>
                <div class="full-stars" style="--percentage: <c:out value='${totalRating}'/>;"></div>
            </div>
            <c:set var = "count" value = "${count}"/>
            <c:if test = "${count == 0}">
                <p class="d-inline-block">0 review</p>
            </c:if>
            <c:if test = "${count == 1}">
                <p class="d-inline-block">1 review</p>
            </c:if>
            <c:if test = "${count > 1}">
                <p class="d-inline-block">${count} reviews</p>
            </c:if>
            <h3 class="fs-6">${oneRestaurant.category}</h3>
        </form>
    </div>

    <div class="container mt-4">
        <a class="btn btn-primary" href="/create/review/restaurant/${oneRestaurant.id}">Write a Review</a>
        <a class="btn btn-info" href="/edit/restaurant/${oneRestaurant.id}">Edit</a>

        <div class="row">
            <div class="col-6">
                <hr>
                <h4>Menu</h4>
                <a class="btn btn-outline-success mt-3" href="/view/restaurant/${oneRestaurant.id}/menus">Full Menu</a>
                <a class="d-block mt-2" href=${oneRestaurant.webAddress}>${oneRestaurant.webAddress}</a>
                <h5 class="mt-2">${oneRestaurant.phone}</h5>
                <p class="text-secondary">${oneRestaurant.address1} ${oneRestaurant.address2} ${oneRestaurant.city}, ${oneRestaurant.state}, ${oneRestaurant.zipCode}</p>
                <hr>
            </div>
            <div id="weather" class="col-3 text-center"></div>
            <div class="col-3 float-right">
                <!-- Google Map API -->
                <div id="map" style="height: 300px; width: 300px;"></div>
                <script async
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsJYJKveqdGf8ZIRe39VqOz1ax3scXasY&callback=initMap">
                </script>
                <p hidden id="address">${oneRestaurant.address1} ${oneRestaurant.address2} ${oneRestaurant.city}, ${oneRestaurant.state}, ${oneRestaurant.zipCode}</p>
                <p hidden id="zip">${oneRestaurant.zipCode},US</p>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <h4 class="mb-3">Recommended Reviews</h4>
                <!-- for loop the review list -->
                <c:forEach items='${reviews}' var='review'>

                    <div class="d-flex">
                        <img class="me-2" style="width: 50px; height: 50px;" src="/images/avatar.png" alt="avatar">
                    
                        <div class="personal-info d-flex flex-column justify-content-center">
                            <h6 class="m-0">${review.user.firstName} ${review.user.lastName}</h6>
                            <p class="m-0 text-secondary" style="font-size: small;"><fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd"/></p>
                        </div>
                    </div>

                    <div class="review-detail p-2">
                        <div class="ratings">
                            <div class="empty-stars"></div>
                            <div class="full-stars" style="--percentage: <c:out value='${review.rating}'/>;"></div>
                        </div>
                        <p class="m-0">${review.comment}</p>
                        <br>
                        <!-- only display the img if we have one -->
                        <c:set var = "pic_length" value = "${fn:length(review.pic_url)}"/>
                        <c:if test = "${pic_length > 1}">
                            <img class="rounded" style="width: 230px;" src="${review.pic_url}" alt="uploaded_img">
                        </c:if>
                    </div>

                </c:forEach>

            </div>
        </div>
    </div>

    <script>
        // make open weather API call
        getCurrentWeather();
        function getCurrentWeather() {
            const zipCode = document.getElementById("zip").innerText;
            // console.log(zipCode);
            axios.get(`https://api.openweathermap.org/data/2.5/weather?`, {
                params: {
                    "zip" : zipCode,
                    "appid": "2b04279bdb925dadd93e1d10246bbfaa",
                }
            })
            .then(function(response) {
                console.log(response.data)
                var temp = convertTemperture(response.data.main.temp).toFixed(2);
                var minTemp = convertTemperture(response.data.main.temp_min).toFixed(2);
                var maxTemp = convertTemperture(response.data.main.temp_max).toFixed(2);
                var weather = response.data.weather[0].main;
                var weatherIcon = response.data.weather[0].icon;
                const weatherOutput = `
                    <img src=/images/\${weatherIcon}.png alt="weather icon">
                    <h4>\${weather}</h4>
                    <p>Temperture: \${temp}&#8457;</p>
                    <p>Min. Temp.: \${minTemp}&#8457;</p>
                    <p>Max. Temp.: \${maxTemp}&#8457;</p>

                `;
                document.getElementById("weather").innerHTML = weatherOutput;
            })
            .catch(function(error) {
                console.log(error);
            })
        }

        function convertTemperture(kelvin) {
            const fahrenheit = (kelvin - 273.15) * 9/5 + 32;
            return fahrenheit;
        }


        getGeoCode()
        // function convert the address into geocode for google Map
        function getGeoCode() {

            const address = document.getElementById("address").innerText;
            // call google geocode API with two params
            axios.get("https://maps.googleapis.com/maps/api/geocode/json", {
                params: {
                    address: address,
                    key: "AIzaSyBsJYJKveqdGf8ZIRe39VqOz1ax3scXasY",
                }
            })
            .then(function(response) {
                // console.log(response);
                // set geo location into two var
                const geometryLocation = response.data.results[0].geometry.location;
                const latitudeVal = geometryLocation.lat;
                const longitudeVal = geometryLocation.lng;
                // console.log(x);
                // console.log(y);
                initMap(latitudeVal, longitudeVal)
            })
            .catch(function(error) {
                console.log(error)
            });
        };


        function initMap (latitude, longtitude) {
            // pin below location to google map
            const location = {
                center: {   lat: latitude,
                            lng: longtitude,
                        },
                zoom: 12,
            };
            // new Map obj to render HTML with location
            map = new google.maps.Map(document.getElementById('map'), location);

            // maker at the Map
            const marker = new google.maps.Marker({
                position: location.center,
                map: map,
            });

            // content will show when we click the map icon
            const mapDetailWindow = new google.maps.InfoWindow({
                content: `<p class="m-0">${oneRestaurant.name}</p>`
            });

            marker.addListener("click", ()=> {
                mapDetailWindow.open(map, marker);
            });
        };
    </script>
    <p id="footer" class="fw-lighter text-center">Responsive Yelp Clone Web Application</p>
</body>
</html>