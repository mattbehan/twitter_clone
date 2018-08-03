class FollowingsController < ApplicationController
	before_action :must_be_logged_in

	def create
		@following = Following.new(followed_user_id: params[:user_id], following_user_id: current_user.id)
		if @following.save
			flash[:alert] = "Following created!"
			redirect_to user_path(params[:user_id])
		else
			flash[:alert] = @following.errors.full_messages.flatten.join(", ")
			redirect_to user_path(params[:user_id])
		end
	end

end