class UsersController < ApplicationController

	before_action :set_user


	def show
		must_be_allowed_to_view(@user)
	end

	protected

	def set_user
		@user = User.includes(:profile, :users_followed).find(params[:id])
	end
end