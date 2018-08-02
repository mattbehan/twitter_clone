FactoryBot.define do

	factory :following do

		association :followed_user, factory: [:user]
		association :following_user, factory: [:user]

	end

end