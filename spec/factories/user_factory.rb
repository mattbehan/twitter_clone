FactoryBot.define do

	factory :user do

		name Faker::Name.name
		handle Faker::Name.unique.first_name
		email Faker::Internet.unique.email
		password "password"
		confirmed_at Time.now

	end

end