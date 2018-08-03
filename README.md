# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Notes:

After reading the specs, it seemed that a lot of basic functionality (editing, updating deleting tweets, deleting blockings and followings) was intentionally not called out for, so I didn't implement it in case this functionality was intended to be done during pairing.

Normally I would shovel name off to the profile model since it doesn't have to be unique, but since Twitter had it as a required field for signup, I put it on the user model. It seems like only handle is unique on twitter, so that went on the user model. I copied the other fields for profile from twitter as well for consistency.

Todo/icebox: consolidate all controller and view calls to visibility actions (e.g. must_be_logged_in, follows?) to visibility methods that set instance variables for pages through application controller helper methods that set instance variables (e.g. @allowed_to_view , @allowed_to_follow) and optimize these methods, benchmarking, pagination, ajaxing + react, search bar, shoveling name off user onto profile model and defaulting handle to name, private profiles

Regrets: Not using git boards, not asking more questions on intended specifications and functionality, not starting before moving week

* Ruby version

* System dependencies
* I believe the only dependency you may have is imagemagick (mac and linux) or file (windows) for paperclip

See https://github.com/thoughtbot/paperclip#requirements

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
