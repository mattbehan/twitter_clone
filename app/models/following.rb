class Following < ApplicationRecord
	validates :followed_user_id, presence: true
	validates :following_user_id, presence: true

	belongs_to :followed_user, class_name: :User
	belongs_to :following_user, class_name: :User
end
