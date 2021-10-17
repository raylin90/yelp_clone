# Java Spring Boot responsive web application that allows users to create restaurant with reviews (yelp clone)

1. Entity Relationship Diagram:
* one to many and many to many relationship
* un-login user is able to perform most of tasks except submit a review
* one user can submit many reviews, and one restaurant can have many reviews
![ERD](/yelp_clone/yelpclone/src/main/webapp/images/ERD.png)

2. Wireframe
![wireframe](/yelp_clone/yelpclone/src/main/webapp/images/yelp_clone_wireframe.png)

3. Technique Used:
* used JSP(JavaServer Pages) and JSTL(JavaServer Pages Standard Tag Library) for front-end view page
* used bootstrap for styling
* used JPA (Java Persistence API) and JPQL (JPA Query Language) to avoid sql injection
* MySQL as backend database
* used SpringBoot Starter Validation to check user input and keep data consistent
* EC2 Deployment using Java JDK, Apache Web Server and MySQL database

4. What I learned:
* built full CRUD Java - Spring Boot using Spring Tool Suite
* built MySQL database with JPA instead of MySQL Workbench
* built-in JPA Query Language for faster and securer way of retrieving data
* learned Bootstrap and made my life easier on styling
* utilizing Google Map API and Open Weather API on my project
* tried image upload and save the path into database

5. What's the difficulty I had:
* relationship setup using OOP: since Java is almost 100% OOP, how to connect a class to another class on relationship become every important. Example like: one to many relationship (restaurant & menu), before at Python, we saved restaurant_id into database, but now in Java, we need to save Restaurant object
* JPQL: it was easy to use but hard to understand how the magic happened behind the hood. Instead of using plain SQL queries(I have full control of what I want), we now have many built-in features already (need to play by the rules). But after I got familiar with customized queries, I got the idea how efficiency and how easy to use it
* applied APIs into my project (Google Map and OpenWeather API), how to get the data and how to parse through the data received was difficult at beginning, but their documentation are clear and helped a lot.
