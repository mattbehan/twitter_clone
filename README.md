# README


Notes:

After reading the specs, it seemed that a lot of basic functionality (editing, updating deleting tweets, deleting blockings and followings) was intentionally not called out for, so I didn't implement it in case this functionality was intended to be done during pairing.

Normally I would shovel name off to the profile model since it doesn't have to be unique, but since Twitter had it as a required field for signup, I put it on the user model. It seems like only handle is unique on twitter, so that went on the user model. I copied the other fields for profile from twitter as well for consistency.

Issues: consolidate all controller and view calls to visibility actions (e.g. must_be_logged_in, follows?) to visibility methods that set instance variables for pages through application controller helper methods that set instance variables (e.g. @allowed_to_view , @allowed_to_follow) and optimize these methods, shoveling name off user onto profile model and defaulting :handle to :name, move timeline and user snippet display to shared view folder since used in multiple pages

Icebox/Todo: benchmarking, pagination, ajaxing + react, private profiles

Regrets: Not using git boards, not asking more questions on intended specifications and functionality, not starting before moving week

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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
