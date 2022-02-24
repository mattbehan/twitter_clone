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

	profile = user.profile
	profile.bio = Faker::Lorem.paragraph
	profile.website = Faker::Internet.url
	profile.location = Faker::Address.city
	profile.birthday = Faker::Date.between(from: 80.years.ago, to: 15.years.ago)
	profile.save
end

users.each do |user1|
	users.sample(5).each do |user2|
		following = Following.new(followed_user_id: user1.id, following_user_id: user2.id)
		following.save
	end
	tweet1 = Tweet.create(user_id: user1.id, message: Faker::Lorem.paragraph)
	tweet1.update(created_at: Faker::Date.between(from: 80.days.ago, to: 15.seconds.ago))
	tweet2 = Tweet.create(user_id: user1.id, message: Faker::Lorem.paragraph)
	tweet2.update(created_at: Faker::Date.between(from: 80.days.ago, to: 15.seconds.ago))
end


matt = User.first
matt.email = "mattbehan@gmail.com"
matt.name = "matt behan"
matt.handle = "mattbehan"
matt.save
