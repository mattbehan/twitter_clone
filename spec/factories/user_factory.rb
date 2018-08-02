FactoryBot.define do

	factory :user do

		name Faker::Name.name
		handle Faker::Name.unique.first_name
		email Faker::Internet.unique.email
		password "password"
		confirmed_at Time.now

		factory :user2 do
			email "user2@gmail.com"
			handle "user2"
		end

	end

end