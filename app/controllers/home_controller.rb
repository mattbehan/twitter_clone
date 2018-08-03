class HomeController < ApplicationController
	def index
		@tweet = Tweet.new
	end

	def unauthorized
		render "/unauthorized"
	end
end