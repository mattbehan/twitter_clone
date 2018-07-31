require 'rails_helper'

feature 'Creating a tweet' do
	let(:user) {create :user}

	scenario 'with valid email and password' do
		login_as(user)
		visit root_path
	end

	scenario 'with invalid email' do

	end

	scenario 'with blank password' do

	end


end