class Blocking < ApplicationRecord
	validates :user_id, presence: true
	validates :blocked_user_id, presence: true
	validate :user_cannot_block_themself


	belongs_to :user
	belongs_to :blocked_user, class_name: :User

	after_create :destroy_followings

	def user_cannot_block_themself
		if user_id == blocked_user_id
			errors.add(:users, "cannot block themselves")
		end
	end

	def destroy_followings
		Following.where(followed_user_id: [user_id, blocked_user_id], following_user_id: [user_id, blocked_user_id]).destroy_all
	end
end
