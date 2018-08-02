require 'rails_helper'

feature "User Visits Home Page" do 

	subject(:user) {create :user}
	context "when not logged in" do
		scenario "renders sign up or sign in options and is on the correct pag" do
			visit root_path
			expect(page).to have_link('Sign In')
			expect(page).to have_css('.sign-up-button')
			expect(page).to have_button('Sign Up')
			expect(current_path).to eq('/')
			# save_and_open_page
		end
	end

	context "when logged in" do
			scenario "does not have sign in options and is on the correct page" do 
			login_as(user)
			visit root_path
			expect(page).to have_no_content('Sign In')
			expect(page).to have_no_content('Sign up')
			expect(current_path).to eq('/')
		end
	end

end