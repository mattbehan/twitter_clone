class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :must_be_owner, :owner?, :must_be_logged_in, :allowed_to_view?, :allowed_to_block?, :allowed_to_follow?, :must_be_allowed_to_view

	# this will redirect the user to the log in page any time they hit any other URL
	# it seems that twitter doesn't let you do anything without being signed in. that is the only reason I've enforced this as an omnipresent before_action
	# could also be done with the devise method !authenticate_user
	before_action :must_be_logged_in, except: [:must_be_logged_in]

	# owner and must be owner were created with the intention of tweet#edit #update and #destroy, however I left those actions unimplemented as they weren't in the spec and I wasn't sure if it was intentional
	def must_be_owner resource_users_id
		unless owner?(resource_users_id)
			redirect_to :unauthorized_path
		end
	end

	def owner? resource_users_id
		user_signed_in? && resource_users_id.to_i == current_user.id
	end

	def must_be_logged_in
		if !user_signed_in?
			flash[:alert] = "Must be logged in for that action"
			redirect_to new_user_session_path unless request.env['PATH_INFO'] == "/users/sign_in"
		end
	end

	def allowed_to_follow? target_user
		@allowed_to_follow ||= user_signed_in? && !current_user.follows?(target_user) && allowed_to_view?(target_user) && current_user.id != target_user.id
	end

	def allowed_to_block? target_user
		@allowed_to_block ||= allowed_to_view?(target_user) && current_user.id != target_user.id
	end

	def allowed_to_view? target_user
		@allowed_to_view ||= user_signed_in? && !Blocking.exists?(user_id: [target_user.id, current_user.id], blocked_user_id: [target_user.id, current_user.id])
	end

	def must_be_allowed_to_view target_user
		redirect_to unauthorized_path_url if !allowed_to_view?(target_user)
	end

end
