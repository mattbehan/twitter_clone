require 'rails_helper'

feature 'Creating a tweet' do
	let(:user) {create :user}
	context "as a logged in user" do
		scenario "with a valid tweet" do
			login_as(user)
			visit root_path
			create_tweet_with("New tweet")
			expect(page).to have_content("Your tweet was created")
		end

		scenario 'with a blank tweet' do
			login_as(user)
			visit root_path
			create_tweet_with("")
			expect(page).to have_content("Message can't be blank")
		end
	end

	context "while not logged in" do
		scenario "with a valid tweet" do
			visit root_path
			create_tweet_with("New tweet")
			expect(page).to have_content("You must be logged in for that action")
			expect(current_path).to eq(unauthorized_user_path)
		end
	end

end