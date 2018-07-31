require 'rails_helper'

feature 'Visitor signs up' do
	scenario 'with valid email and password' do
		sign_up_with 'mattbehan13@gmail.com', 'password', "matt", "mattb"
		expect(current_path).to eq(root_path)
		expect(page).to have_no_content("Sign up")
	end

	scenario 'with invalid email' do
		sign_up_with 'invalid', 'password', "matt", "mattb"
		expect(page).to have_content('Sign up')
		expect(current_path).to eq("/users")
	end

	scenario 'with blank password' do
		sign_up_with 'mattbehan@gmail.com', '', "matt", "mattb"
		expect(page).to have_content('Sign up')
		expect(current_path).to eq("/users")
	end
end

feature 'Visitor signs in' do

	subject(:user) {create :user}

	scenario 'with valid email and password' do
		sign_in_with(user.email, "password")
		expect(current_path).to eq("/")
		expect(page).to have_no_content("Sign up")
	end

	scenario 'with invalid password for email' do
		sign_in_with(user.email, "invalid_password")
		expect(page).to have_content('Sign up')
		expect(current_path).to eq(new_user_session_path)
	end

end