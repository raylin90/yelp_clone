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
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style>
    #map {
        height: 300px;
        width: 300px;
    }

    </style>
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
        <a class="btn btn-info" href="/edit/restaurant/${oneRestaurant.id}">Edit</a>

        <div class="row">
            <div class="col-9"></div>
            <div class="col-3 float-right">
                <!-- Google Map API -->
                <div id="map">Google Map</div>
                <!-- <script async
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsJYJKveqdGf8ZIRe39VqOz1ax3scXasY&callback=initMap">
                </script> -->
                <h5 class="m-0">${oneRestaurant.name}</h5>
                <p class="m-0">${oneRestaurant.address1} ${oneRestaurant.address2}</p>
                <p>${oneRestaurant.city}, ${oneRestaurant.state}, ${oneRestaurant.zipCode}</p>
                <p hidden id="address">${oneRestaurant.address1} ${oneRestaurant.address2} ${oneRestaurant.city}, ${oneRestaurant.state}, ${oneRestaurant.zipCode}</p>
            </div>
        </div>
    </div>


    <!-- <script>
        getGeoCode()
        // function convert the address into geocode
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
                console.log("hi")
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
    </script> -->
</body>
</html>