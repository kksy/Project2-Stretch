# Project 2 - Stretch App

## Overview

This app encourages users to try new things outside their comfort zone. The challenges (Stretches) are both system and user generated, and the users will be able to save the Stretches to their pending list. Each Stretch is divided into one of: social, hobby and adventure. If completed, they can choose to write a short entry on their experiences and upload an image.

This was a 5-day project made during my Web Development Immersive Course at General Assembly in 2015

<b>Live Demo:</b> https://stretchapp.herokuapp.com/
+ username: user1@example.com
+ password: password123

## Features

+ Log In and Sign Up system
+ User can create a Stretch
+ User can add a Stretch to their pending list
+ User can create an entry and choose to upload an image 
+ Masonry Grid for inspiration entries
+ Admin deletion of Stretches
+ Search by category

## Technologies


+ HTML5
+ CSS3
+ Bootstrap
+ JavaScript, including
  - Masonry
+ Ruby
+ Active Record
+ Sinatra
+ PostgreSQL
+ Deployment: Heroku

## Database

![alt text](public/images/project2-database.PNG?raw=true)

## Known Issues

+ Image upload stored temporarily in heroku
+ Deleting a Stretch does not delete the entries that go along with it
+ Deleting a user does not delete the entries they have created

## Feedback from users (testers)
+ The long list in the Category section ('/stretches') is distracting
+ The main Stretch page should focus more on images

## Stretch Goals
2. users can 'like' posts
2. users can set their posts to private
3. e-mail verification
