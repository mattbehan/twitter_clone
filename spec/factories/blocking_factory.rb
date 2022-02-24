FactoryBot.define do

	factory :blocking do

		user
		association :blocked_user, factory: :user

	end

end