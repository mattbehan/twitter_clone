require 'rails_helper'

feature 'Following another user' do
	let(:user) {create :user}
	let(:user_to_follow) {create :user}
	before {login_as(user)}

	context 'when the user is not already following the other user' do
		scenario "creates a following between the user" do
			visit user_path(user_to_follow)
			click_button "Follow"
			expect(Following.last.followed_user_id).to eq(user_to_follow.id)
			expect(Following.last.following_user_id).to eq(user.id)
		end
	end

	context 'when the user is already following the user' do
		scenario "there is no option to follow the other user" do
			Following.create(followed_user_id: user_to_follow.id, following_user_id: user.id)
			visit user_path(user_to_follow)
			expect(page).to have_no_button('Follow')
		end
	end

	context 'when the user is blocked by the other user' do
		scenario "the user is redirected to unauthorized" do
			Blocking.create(user_id: user_to_follow.id, blocked_user_id: user.id)
			visit user_path(user_to_follow)
			expect(current_path).to eq("/unauthorized")
		end
	end
end
