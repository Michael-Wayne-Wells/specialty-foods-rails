# _Specialty Products_

#### _Specialty Products and Reviews_

#### By _**Michael Wells**_

## Description
This application provides a resources for users to:
* register and login with username or email.
* Passwords are stored securely via the use of Devise.
* Add, edit, view, and delete products
* Add a review and rating for a product
* Search for products by name
* View most recent products
* View US products
* View most rated product
* Validate that all forms were filled out correctly
* Titleize products & tilteize country_of_origin
* Seed a database
* Receive flash messages when new entries are created.

Admin:
* provides and admin console for ease of use and making changes to database.
* Creates a default admin account
* log in and out of main website and admin Console
* full CRUD on users, admin, products, and reviews via the admin Console
* full CRUD on products via the website
* Admin can interact with website with same functunality as a user with added privileges.


## Setup/Installation Requirements
View on Heroku here: https://arcane-ravine-40808.herokuapp.com/

clone and open the file locally
in terminal run:

>$ git clone https://github.com/Michael-Wayne-Wells/specialty-food-rails.git

navigate to project folder and install gem bundles

>$ cd specialty-foods-rails

>$ gem install bundler

>$ bundle install

start postgres(if not already), duplicate database, and seed:

>$ postgres

>$ rake db:create

>$ rake db:migrate

>$ rake db:seed

Seeding will create a default admin user.
credentials:
username: admin
password: password

You will use these credentials to log into the admin areas of the website as well as the admin terminal. You should Update these credentials immediatly in the Admin Terminal. http://localhost:3000/admin

run program script in terminal

>$ rails -s

Open browser and go to https://localhost:3000/admin

login with:
username: admin
password: password

Click "admin" in the upper right corner of the page and then "edit" to change username, email, and password.

## Known Bugs

_No known bugs_

## Support and contact details

_If you have any issues with the program or want to reach out, email [mwells1286@gmail.com](href="mailto:mwells1286@gmail.com")_

## Technologies Used

_This program utilized:_
* _RUBY 2.6.5_
* _Rails 5.2.4_
* _Heroku_
* _Rubocop_
* _Devise_
* _ActiveAdmin_
* _faker_
* _rspec_
* _capybara_
* _bootstrap_
* _kaminari_
* _shoulda-matchers_
* _HTML_
* _postgres_
* _sass_

_and was built on Atom_

### License

*Licensed under MIT license*

Copyright (c) 2020 **_Michael Wells_**
