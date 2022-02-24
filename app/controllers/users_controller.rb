class UsersController < ApplicationController

	before_action :set_user, except: :message_user

	def show
		must_be_allowed_to_view(@user)
		@timeline = @user.tweets
	end

	def message_user
        @sender = current_user
        @user = User.includes(:tweets, :followings_following, :followings_followers,
			profile: [:picture_attachment, :picture_blob, :background_picture_attachment, :background_picture_blob]).find(current_user.id)
        @receiver = User.find(params[:receiver_id])
        @messages = Message.where(sender_id: @sender.id, receiver_id: @receiver.id).or(Message.where(sender_id: @receiver.id, receiver_id: @sender.id))
        @chat_id = [@sender.id, @receiver.id].sort.join("") #generates a unique identifier for a pair of user 
	end

	protected

	def set_user
		@user = User.includes(:tweets, :followings_following, :followings_followers,
			profile: [:picture_attachment, :picture_blob, :background_picture_attachment, :background_picture_blob]).find(params[:id])
	end
end