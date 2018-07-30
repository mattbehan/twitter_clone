require 'rails_helper'

feature 'Visitor signs up' do
	scenario 'with valid email and password' do
		sign_up_with 'mattbehan13@gmail.com', 'password', "matt", "mattb"
		expect(current_path).to eq("/")
		expect(page).to have_no_content("Sign up")
	end

	scenario 'with invalid email' do
		sign_up_with 'invalid', 'password', "matt", "mattb"
		expect(page).to have_content('Sign up')
		expect(current_path).to eq('/users')
	end

	scenario 'with blank password' do
		sign_up_with 'mattbehan@gmail.com', '', "matt", "mattb"
		expect(page).to have_content('Sign up')
		expect(current_path).to eq('/users')
	end

	def sign_up_with(email, password, name, handle)
		visit new_user_registration_path
		fill_in 'Email', with: email
		fill_in 'Name', with: name
		fill_in 'Handle', with: handle
		fill_in 'Password', with: password
		fill_in 'Password confirmation', with: password
		click_button 'Sign up'
	end
end