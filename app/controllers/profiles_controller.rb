class ProfilesController < ApplicationController
	before_action :must_be_logged_in, :set_profile
	before_action do
		must_be_owner(@profile.user_id)
	end

	def edit
	end

	def update
		@profile.update(profile_update_params)
		if @profile.valid?
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	protected

	def profile_update_params
		params.require(:profile).permit(:picture, :bio, :location, :website, :birthday)
	end

	def set_profile
		@profile = current_user.profile
	end
end