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
                    <a class="btn btn-primary" href="/register">Login</a>
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
                            <option value="AL">AL</option>
                            <option value="AK">AK</option>
                            <option value="AR">AR</option>	
                            <option value="AZ">AZ</option>
                            <option value="CA">CA</option>
                            <option value="CO">CO</option>
                            <option value="CT">CT</option>
                            <option value="DC">DC</option>
                            <option value="DE">DE</option>
                            <option value="FL">FL</option>
                            <option value="GA">GA</option>
                            <option value="HI">HI</option>
                            <option value="IA">IA</option>	
                            <option value="ID">ID</option>
                            <option value="IL">IL</option>
                            <option value="IN">IN</option>
                            <option value="KS">KS</option>
                            <option value="KY">KY</option>
                            <option value="LA">LA</option>
                            <option value="MA">MA</option>
                            <option value="MD">MD</option>
                            <option value="ME">ME</option>
                            <option value="MI">MI</option>
                            <option value="MN">MN</option>
                            <option value="MO">MO</option>	
                            <option value="MS">MS</option>
                            <option value="MT">MT</option>
                            <option value="NC">NC</option>	
                            <option value="NE">NE</option>
                            <option value="NH">NH</option>
                            <option value="NJ">NJ</option>
                            <option value="NM">NM</option>			
                            <option value="NV">NV</option>
                            <option value="NY">NY</option>
                            <option value="ND">ND</option>
                            <option value="OH">OH</option>
                            <option value="OK">OK</option>
                            <option value="OR">OR</option>
                            <option value="PA">PA</option>
                            <option value="RI">RI</option>
                            <option value="SC">SC</option>
                            <option value="SD">SD</option>
                            <option value="TN">TN</option>
                            <option value="TX">TX</option>
                            <option value="UT">UT</option>
                            <option value="VT">VT</option>
                            <option value="VA">VA</option>
                            <option value="WA">WA</option>
                            <option value="WI">WI</option>	
                            <option value="WV">WV</option>
                            <option value="WY">WY</option>
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