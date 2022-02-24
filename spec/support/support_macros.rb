module SupportMacros

	module Features
		def sign_up_with email, password, name, handle
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Name', with: name
			fill_in 'Handle', with: handle
			fill_in 'Password', with: password
			fill_in 'Password confirmation', with: password
			click_button 'Sign up'
		end

		def sign_in_with email, password
			visit new_user_session_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			click_button 'Log in'
		end

		def create_tweet_with message
			fill_in "tweet[message]", with: message, wait: 10
			click_button "Create Tweet"
		end
	end

end