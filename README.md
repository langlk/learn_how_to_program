# Learn How to Program Clone

### _Epicodus Practice in Rails, November 14, 2017_

### By Kelsey Langlois

## Description

_Rails practice in cloning the functionality of Epicodus's site [learnhowtoprogram.com](http://learnhowtoprogram.com)._

## Set-up/Installation Instructions

* Clone this repository
* From the project root directory, run the following commands:
  * **Note: seeding the database will remove all existing data and replace it.**
  ```
  bundle install
  rake db:create
  rake db:migrate
  rake db:seed
  rake db:test:prepare
  rails s
  ```
* You can then access the app in your web browser at ```localhost:3000```

## Specifications

* Lessons Model
  * Name
  * Text Content
  * Number
  * CRUD Functionality
  * Belongs to Section
* Next Lesson link goes to next lesson in order (Based on lesson #)
* Previous Lesson link goes to previous lesson in order
* Section Model
  * Has many lessons
* Table of contents for Section shows all Lessons
  * Ordered by lesson #
* Course
  * Has many sections

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*

