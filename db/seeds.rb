# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
10.times do
	user = User.new(
		name: Faker::Name.name,
		handle: Faker::Name.unique.first_name,
		email: Faker::Internet.unique.email,
		password: "password"
		)
	user.skip_confirmation!
	user.save
	users.push(user)
end

users.each do |user1|
	users.each do |user2|
		following = Following.new(followed_user_id: user1.id, following_user_id: user2.id)
		following.save
	end
	Tweet.create(user_id: user1.id, message: Faker::Lorem.paragraph)
	Tweet.create(user_id: user1.id, message: Faker::Lorem.paragraph)
end

matt = User.first
matt.email = "mattbehan@gmail.com"
matt.save