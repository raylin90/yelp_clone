<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a New Restaurant</title>
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-6">
                <h3>Create a New Restaurant</h3>
                <form:form action='/add/restaurant' method='post' modelAttribute='restaurant'>
                <p>
                    <form:label class="form-label" path='name'>Restaurant Name: </form:label>
                    <form:input class="form-control" path='name'/>
                    <form:errors class="text-danger" path='name'/>
                </p>
                <p>
                    <form:label class="form-label" path='address1'>Address 1: </form:label>
                    <form:input class="form-control" path='address1'/>
                    <form:errors class="text-danger" path='address1'/>
                </p>
                <p>
                    <form:label class="form-label" path='address2'>Address2: </form:label>
                    <form:input class="form-control" path='address2'/>
                    <form:errors class="text-danger" path='address2'/>
                </p>
                <div class="d-flex justify-content-between">
                    <p>
                        <form:label class="form-label" path='city'>City: </form:label>
                        <form:input class="form-control" path='city'/>
                        <form:errors class="text-danger" path='city'/>
                    </p>
                    <p>
                        <form:label class="form-label" path='state'>State: </form:label>
                        <form:select class="form-control" path='state'>
                            <option value=""></option>
                            <option value="AL">Alabama</option>
                            <option value="AL">Alabama</option>
                            <option value="AK">Alaska</option>
                            <option value="AZ">Arizona</option>
                            <option value="AR">Arkansas</option>
                            <option value="CA">California</option>
                            <option value="CO">Colorado</option>
                            <option value="CT">Connecticut</option>
                            <option value="DE">Delaware</option>
                            <option value="DC">District Of Columbia</option>
                            <option value="FL">Florida</option>
                            <option value="GA">Georgia</option>
                            <option value="HI">Hawaii</option>
                            <option value="ID">Idaho</option>
                            <option value="IL">Illinois</option>
                            <option value="IN">Indiana</option>
                            <option value="IA">Iowa</option>
                            <option value="KS">Kansas</option>
                            <option value="KY">Kentucky</option>
                            <option value="LA">Louisiana</option>
                            <option value="ME">Maine</option>
                            <option value="MD">Maryland</option>
                            <option value="MA">Massachusetts</option>
                            <option value="MI">Michigan</option>
                            <option value="MN">Minnesota</option>
                            <option value="MS">Mississippi</option>
                            <option value="MO">Missouri</option>
                            <option value="MT">Montana</option>
                            <option value="NE">Nebraska</option>
                            <option value="NV">Nevada</option>
                            <option value="NH">New Hampshire</option>
                            <option value="NJ">New Jersey</option>
                            <option value="NM">New Mexico</option>
                            <option value="NY">New York</option>
                            <option value="NC">North Carolina</option>
                            <option value="ND">North Dakota</option>
                            <option value="OH">Ohio</option>
                            <option value="OK">Oklahoma</option>
                            <option value="OR">Oregon</option>
                            <option value="PA">Pennsylvania</option>
                            <option value="RI">Rhode Island</option>
                            <option value="SC">South Carolina</option>
                            <option value="SD">South Dakota</option>
                            <option value="TN">Tennessee</option>
                            <option value="TX">Texas</option>
                            <option value="UT">Utah</option>
                            <option value="VT">Vermont</option>
                            <option value="VA">Virginia</option>
                            <option value="WA">Washington</option>
                            <option value="WV">West Virginia</option>
                            <option value="WI">Wisconsin</option>
                            <option value="WY">Wyoming</option>
                        </form:select>
                        <form:errors class="text-danger" path='state'/>
                    </p>
                    <p>
                        <form:label class="form-label" path='zipCode'>ZipCode: </form:label>
                        <form:input class="form-control" path='zipCode'/>
                        <form:errors class="text-danger" path='zipCode'/>
                    </p>
                </div>
                <p>
                    <form:label class="form-label" path='category'>Category: </form:label>
                    <form:select class="form-control" path='category'>
                        <option value=""></option>
                        <option value="Fine Dining">Fine Dining</option>
                        <option value="Casual Dining">Casual Dining</option>
                        <option value="Family Style">Family Style</option>
                        <option value="Fast Food">Fast Food</option>
                        <option value="Food Truck, Cart, Or Stand">Food Truck</option>
                        <option value="Buffet">Buffet</option>
                        <option value="Pub">Pub</option>
                        <option value="Barbecue Grill">Barbecue Grill</option>
                    </form:select>
                    <form:errors class="text-danger" path='category'/>
                </p>
                <p>
                    <form:label class="form-label" path='phone'>Phone: </form:label>
                    <form:input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" class="form-control" path='phone' placeholder="123-456-7890"/>
                    <form:errors class="text-danger" path='phone'/>
                </p>
                <p>
                    <form:label class="form-label" path='webAddress'>Web Address: </form:label>
                    <form:input type="url" class="form-control" path='webAddress' placeholder="http://www.companyaddress.com"/>
                    <form:errors class="text-danger" path='webAddress'/>
                </p>
                <input class="btn btn-secondary"type='submit' value='Submit'/>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>