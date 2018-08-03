class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def must_be_owner resource_users_id
		unless owner?(resource_users_id)
			redirect_to :unauthorized_path
		end
	end

	def owner? resource_users_id
		user_signed_in? && resource_users_id.to_i == current_user.id
	end
end
