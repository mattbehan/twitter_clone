require 'rails_helper'

feature 'Blocking another user' do
	let(:user) {create :user}
	let(:user_to_block) {create :user}
	before {login_as(user)}

	context 'when the user is not already already blocked by the other user' do
		scenario "creates a blocking between the user" do
			visit user_path(user_to_block)
			click_button "Block"
			expect(Blocking.last.blocked_user_id).to eq(user_to_block.id)
			expect(Blocking.last.user_id).to eq(user.id)
		end
	end

	context 'when the user is already blocking the user' do
		scenario "there is no option to block the other user" do
			Blocking.create(blocked_user_id: user_to_block.id, user_id: user.id)
			visit user_path(user_to_block)
			expect(page).to have_no_button('Block')
		end
	end

	context 'when the user is blocked by the other user' do
		scenario "the user is redirected to unauthorized" do
			Blocking.create(user_id: user_to_block.id, blocked_user_id: user.id)
			visit user_path(user_to_block)
			expect(current_path).to eq("/unauthorized")
		end
	end
end

feature 'Viewing the content of a user who has blocked you' do

	let(:blocking) {create :blocking}
	before {login_as(blocking.blocked_user)}


	scenario "the user is redirected to an unauthorized page" do 
		visit user_path(blocking.user_id)
		expect(current_path).to eq("/unauthorized")
	end

end