class HomeController < ApplicationController
	def index
		if user_signed_in?
			@user = User.includes(:tweets, :followings_following, :followings_followers, :users_followed, :receivers,
				profile: [:picture_attachment, :picture_blob, :background_picture_attachment, :background_picture_blob]).find(current_user.id)
			@timeline = @user.timeline
		end
		@tweet = Tweet.new
	end

	def unauthorized
		render "/unauthorized"
	end
end