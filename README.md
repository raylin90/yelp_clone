# Yummy
Java Spring Boot responsive web application that allow users to create restaurant with reviews (yelp clone)

------------------
### Entity Relationship Diagram:
* one to many and many to many relationship
* unlogin user is able to perform most of tasks except submit a review
* one user can submit many reviews, and one restaurant can have many reviews
![ERD](/yelpclone/src/main/webapp/images/ERD.png)

------------------
### Wireframe:
![wireframe](/yelpclone/src/main/webapp/images/yelp_clone_wireframe.png)

------------------
### Tech/framework used
__Built with__
- JSP(JavaServer Pages) and JSTL(JavaServer Pages Standard Tag Library) for front-end view
- Bootstrap for styling
- JPA (Java Persistence API) and JPQL (JPA Query Language) to avoid SQL injection
- MySQL as backend database
- SpringBoot Starter Validation to check user input and keep data consistent
- EC2 Deployment using Java JDK, Apache Web Server and MySQL database (does not work due to multipart file upload for images)

------------------
### Spotlights:
1. built full CRUD Java - Spring Boot using Spring Tool Suite
2. built a MySQL database with JPA instead of MySQL Workbench
3. built-in JPA Query Language for faster and secure way of retrieving data
4. I learned Bootstrap and made my life easier on styling
5. utilizing Google Map API and Open Weather API on my project
6. tried image upload and save the path into database

------------------
### Difficulties:
1. relationship setup using OOP: since Java is almost 100% OOP, how to connect a class to another class on relationships becomes very important. Example like: one to many relationships (restaurant & menu), before in Python, we saved restaurant_id into a database, but now in Java, we need to save Restaurant object
2. JPQL: it was easy to use but hard to understand how the magic happened behind the hood. Instead of using plain SQL queries(I have full control of what I want), we now have many built-in features already (need to play by the rules). But after I got familiar with customized queries, I got the idea how efficiency and how easy to use it
3. applied APIs into my project (Google Map and OpenWeather API), how to get the data and how to parse through the data received was difficult at the beginning, but their documentation is clear and helped a lot.

------------------
### Installation
```
# copy repository link
$ repo URL: https://github.com/raylin90/yelp_clone.git

# Open SpringToolSuite
# SpringToolSuite - Windows - Show View - Others... - Git Repositories - Clone a Git repository
# Import Git repo into your local machine

# Insert API keys
* add Goole Map API Key on path (yelp_clone/yelpclone/src/main/webapp/WEB-INF/restaurant/view.jsp), line 104
* add OpenWeather API Key on path (yelp_clone/yelpclone/src/main/webapp/WEB-INF/restaurant/view.jsp), line 155

# Run the app as Spring Boot App
# Navigate to our local host
```
