require 'rails_helper'

feature 'Visitor signs up' do
	context 'with valid email and password' do
		scenario "signs up the user and renders proper content" do
			sign_up_with 'mattbehan13@gmail.com', 'password', "matt", "mattb"
			expect(current_path).to eq(root_path)
			expect(page).to have_no_content("Sign up")
		end
	end

	context 'with invalid email' do
		scenario "does not register the user and rerenders form" do
			sign_up_with 'invalid', 'password', "matt", "mattb"
			expect(page).to have_content('Sign up')
			expect(current_path).to eq("/users")
		end
	end

	context 'with blank password' do
			scenario "does not register the user and rerenders form" do
			sign_up_with 'mattbehan@gmail.com', '', "matt", "mattb"
			expect(page).to have_content('Sign up')
			expect(current_path).to eq("/users")
		end
	end
end

feature 'Visitor signs in' do

	subject(:user) {create :user}

	context 'with valid email and password' do
		scenario "user is signed in and redirected to root path" do
			sign_in_with(user.email, "password")
			expect(current_path).to eq("/")
			expect(page).to have_no_content("Sign up")
		end
	end

	context 'with invalid password for email' do
		scenario "user is not signed in and the form is rerendered" do 
			sign_in_with(user.email, "invalid_password")
			expect(page).to have_content('Sign up')
			expect(current_path).to eq(new_user_session_path)
		end
	end

end