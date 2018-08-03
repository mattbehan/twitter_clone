class UsersController < ApplicationController

	before_action :set_user


	def show
		must_be_allowed_to_view(@user)
		@timeline = @user.timeline
	end

	protected

	def set_user
		@user = User.find(params[:id])
	end
end