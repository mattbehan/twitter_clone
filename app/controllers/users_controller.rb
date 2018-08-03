class UsersController < ApplicationController

	def show
		@user = User.includes(:profile).find(params[:id])
	end
end