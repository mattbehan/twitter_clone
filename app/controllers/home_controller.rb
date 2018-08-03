class HomeController < ApplicationController
	def index
		if user_signed_in?
			@user = User.find(current_user.id)
			@timeline = @user.timeline
		end
		@tweet = Tweet.new
	end

	def unauthorized
		render "/unauthorized"
	end
end