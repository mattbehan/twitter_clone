require 'pry'

class TweetsController < ApplicationController
	before_action :set_tweet, only: [ :edit, :update, :destroy]

	def timeline
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			flash[:message] = "Tweet successfully created!"
			redirect_to root_path
		else
			render :new
		end
	end

	# not needed from spec
	# def edit
	# end

	# def update
	# end

	# def destroy
	# end


	private

	def set_tweet
		@team = Tweet.find(params[:id])
	end

	def tweet_params
		params.require(:tweet).permit(:message).merge(user_id: current_user.id)
	end
end