FactoryBot.define do

	factory :user do

		name Faker::Name.name
		sequence(:handle) { |n| "user#{n}" }
		sequence(:email) { |n| "user#{n}@test.com" }
		password "password"
		confirmed_at Time.now

		factory :user2 do
			email "user2@gmail.com"
			handle "user2"
		end

	end

end