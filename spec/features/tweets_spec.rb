require 'rails_helper'

feature 'Creating a tweet' do
	subject(:user) {create :user}
	context "when logged in with a valid tweet" do
		# with these end to end tests I'm allowing more than one assertion per test to avoid repeated setup
		scenario "the user's tweet is created and they are redirected to root" do
			login_as(user)
			visit new_tweet_path
			create_tweet_with("New tweet")
			expect(current_path).to eq(root_path)
			expect(Tweet.last.user_id).to eq(user.id)
		end
	end

	context "when logged in with a blank tweet" do

		scenario "the tweet is not created and an error message is displayed" do
			total_tweets = Tweet.count
			login_as(user)
			visit new_tweet_path
			create_tweet_with("")
			expect(page).to have_content("Message can't be blank")
			expect(total_tweets).to eq(Tweet.count)
		end
	end

	context "while not logged in" do
		scenario "a user cannot create a tweet" do
			visit new_tweet_path
			expect(page).to have_no_button("Create Tweet")
		end
	end

end