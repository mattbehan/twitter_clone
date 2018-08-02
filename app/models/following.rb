class Following < ApplicationRecord
	validates :followed_user_id, presence: true
	validates :following_user_id, presence: true
	validates :followed_user_id, uniqueness: {scope: :following_user_id}
	validate :user_cannot_follow_themselves


	belongs_to :followed_user, class_name: :User
	belongs_to :following_user, class_name: :User

	def user_cannot_follow_themselves
		if followed_user_id == following_user_id
			errors.add(:users, "cannot follow themselves")
		end
	end
end
