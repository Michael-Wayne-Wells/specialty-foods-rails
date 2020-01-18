# README

# _Specialty Products_

#### _Specialty Products and Reviews_

#### By _**Michael Wells**_

## Description
This application provides a resources for users to:
* Add, edit, view, and delete products
* Add a review and rating for a product
* Search for products by name
* View most recent products
* View US products
* View most rated product
* Validate that all forms were filled out correctly
* Titleize products
* Seed a database
* Receive flash messages when new entries are created.


## Setup/Installation Requirements


clone and open the file locally
in terminal run:

>$ git clone https://github.com/Michael-Wayne-Wells/ruby_builder.git

navigate to project folder and install gem bundles

>$ cd volunteer_tracker
>$ gem install bundler
>$ bundle install

start postgres(if not already), duplicate database, and seed:

>$ postgres
>$ rake db:create
>$ rake db:migrate
>$ rake db:seed


run program script in terminal

>$ rails -s

Open browser and go to https://localhost:3000

## Known Bugs

_No known bugs_

## Support and contact details

_If you have any issues with the program or want to reach out, email [mwells1286@gmail.com](href="mailto:mwells1286@gmail.com")_

## Technologies Used

_This program utilized:_
* _RUBY 2.6.5_
* _Rails 5.2.4_
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
