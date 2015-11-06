# Project 2 - App Name

##Introduction

#### Description

This app encourages users to try new things outside their comfort zone. The challenges (Stretches) are both system and user generated, and the users will be able to save the Stretches to their pending list. Each Stretch is divided into one of: social, hobby and adventure. If completed, they can choose to write a short entry on their experiences and upload an image.

<b>Project Link:</b> https://stretchapp.herokuapp.com/

#### Technologies
Languages:
+ Ruby
+ HTML
+ CSS
+ Javascript
+ Sinatra (DSL)

ORDBMS:
+ PostgreSQL

Frameworks:
+ Active Record
+ Bootstrap

Libraries:
+ Masonry

Cloud Platform:
+ Heroku

#### CRUD

###### Create
+ User:
  - Name
  - E-mail
  - Password

+ Stretch:
  - Stretches will be created and placed into categories

+ Entry:
  - An entry will be created when a user puts a Stretch to the pending list

###### Read
+ List of stretches
+ List of entries by user

###### Update
+ User:
  - Users can add challenges to their pending list
  - Stretches can be set to completed
  - Users can add their experience through image or post

###### Delete
+ User
  - Users can delete entries

+ Stretches:
  - Stretches can be deleted by admin

## Known Issues

#### Functions
+ image upload stored temporarily in heroku
+ deleting a Stretch does not delete the entries that go along with it
+ deleting a user does not delete the entries they have created

#### Feedback from users
+ The long list in the Category section ('/stretches') is distracting
+ The main Stretch page should focus more on images

## Stretch Goals
2. users can 'like' posts
2. users can set their posts to private
3. e-mail authentication
