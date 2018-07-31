module SupportMacros

	module Controllers
		def login_user
			before(:each) do
				@request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryBot.build(:user)
				user.skip_confirmation!
				user.save
				sign_in user
			end
		end

		def register_user
			before(:each) do
				@request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryBot.build(:user)
				user.skip_confirmation!
				user.save
			end
		end

	end

	module Features
		def sign_up_with(email, password, name, handle)
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Name', with: name
			fill_in 'Handle', with: handle
			fill_in 'Password', with: password
			fill_in 'Password confirmation', with: password
			click_button 'Sign up'
		end

		def sign_in_with(email, password)
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			click_button 'Log In'
		end
	end

end