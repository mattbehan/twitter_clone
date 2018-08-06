# README

##App Usage

https://arcane-basin-83069.herokuapp.com/

log in credentials
username: mattbehan@gmail.com password: "password"

You can complete the registration process to sign up as a new user. Every users password has been set to "password". As mentioned in the next sections, I think some of my design decisions (not implementing basic funtionality assuming this functionality was intentionally omitted from the spec... You know what they say about assuming) make the site a little awkward to use. I would recommend running rake routes to highlight what is available

##App behavior
Timeline can be viewed from home, whereas viewing a specific user page will show only that users tweets
You must be signed in to view users profile pages
You cannot view any user information for users that have blocked you, or that you have blocked
You can only follow users, no unfollowing. Same with blocking


##Gems used
Postgres DB
Bootstrap styling
Authentication + account confirmation and emails - Devise
Paperclip for image upload
Testing - Rspec test suite w/ capybara for integration tests, factory bot for fixtures
Seeding - Faker
Pry for debugging

##Notes

After reading the specs, it seemed that a lot of basic functionality (editing, updating deleting tweets, deleting blockings and followings) was intentionally not called out for, so I didn't implement it in case this functionality was intended to be done during pairing.

Normally I would shovel name off to the profile model since it doesn't have to be unique, but since Twitter had it as a required field for signup, I put it on the user model. It seems like only handle is unique on twitter, so that went on the user model. I copied the other fields for profile from twitter as well for consistency.

##Issues 
consolidate all controller and view calls to visibility actions (e.g. must_be_logged_in, follows?) to visibility methods that set instance variables for pages through application controller helper methods that set instance variables (e.g. @allowed_to_view , @allowed_to_follow) and optimize these methods, shoveling name off user onto profile model and defaulting :handle to :name, move timeline and user snippet display to shared view folder since used in multiple pages

##Icebox/Todo 
benchmarking, pagination, ajaxing + react, private profiles

## #Regrets: Not using git boards, not asking more questions on intended specifications and functionality, not starting before moving week

* Ruby version
2.4.4

* System dependencies
* I believe the only dependency you may have is imagemagick (mac and linux) or file (windows) for paperclip

See https://github.com/thoughtbot/paperclip#requirements

* Configuration

* Database creation

* Database initialization
rake db:migrate:reset
rake db:seed

* How to run the test suite
rspec spec

* ...
