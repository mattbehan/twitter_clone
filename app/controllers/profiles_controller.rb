class ProfilesController < ApplicationController
	before_action :set_profile

	def edit
	end

	def update
		must_be_owner(@profile.user_id)
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