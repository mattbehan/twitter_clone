require 'rails_helper'

feature "User Visits Home Page" do 

	subject(:user) {create :user}

	scenario "is not logged in" do
		visit root_path
		expect(page).to have_link('Sign In')
		expect(page).to have_css('.sign-up-button')
		expect(page).to have_button('Sign Up')
		expect(current_path).to eq('/')
		# save_and_open_page
	end

	scenario "is logged in" do
		expect(page).to have_no_content('Sign In')
		expect(page).to have_no_content('Sign up')
		expect(current_path).to eq('/')
	end

end