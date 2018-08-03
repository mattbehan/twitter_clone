class BlockingsController < ApplicationController
	before_action :must_be_logged_in

	def create
		@blocking = Blocking.new(user_id: current_user.id, blocked_user_id: params[:user_id])
		if @blocking.save
			flash[:alert] = "Blocking created! Taking you back to your own page."
			redirect_to user_path(current_user)
		else
			flash[:alert] = @blocking.errors.full_messages.flatten.join(", ")
			redirect_to unauthorized_path
		end
	end

end