class Blocking < ApplicationRecord
	validates :user_id, presence: true
	validates :blocked_user_id, presence: true
	validate :user_cannot_block_themself


	belongs_to :user
	belongs_to :blocked_user, class_name: :User

	def user_cannot_block_themself
		if user_id == blocked_user_id
			errors.add(:users, "cannot block themselves")
		end
	end
end
