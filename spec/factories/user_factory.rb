FactoryBot.define do

	factory :user do
		name { Faker::Name.name }
		sequence(:handle) { |n| "user#{n}" }
		sequence(:email) { |n| "user#{n}@test.com" }
		password { "password" }
		confirmed_at { Time.now }

		initialize_with {User.find_or_initialize_by(email: email) }
		
	end

end