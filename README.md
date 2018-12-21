# README

##App Usage

https://arcane-basin-83069.herokuapp.com/

log in credentials
username: mattbehan@gmail.com password: "password"

##Gems used
Postgres DB
Bootstrap styling
Authentication + account confirmation and emails - Devise
Paperclip for image upload
Testing - Rspec test suite w/ capybara for integration tests, factory bot for fixtures
Seeding - Faker
Pry for debugging

##Issues 
consolidate all controller and view calls to visibility actions (e.g. must_be_logged_in, follows?) to visibility methods that set instance variables for pages through application controller helper methods that set instance variables (e.g. @allowed_to_view , @allowed_to_follow) and optimize these methods, shoveling name off user onto profile model and defaulting :handle to :name, move timeline and user snippet display to shared view folder since used in multiple pages

##Icebox/Todo 
benchmarking, pagination, ajaxing + react, private profiles

* Ruby version
2.4.4

* System dependencies
* I believe the only dependency you may have is imagemagick (mac and linux) or file (windows) for paperclip

See https://github.com/thoughtbot/paperclip#requirements

* Database initialization
rake db:migrate:reset
rake db:seed

* How to run the test suite
rspec spec

* ...
