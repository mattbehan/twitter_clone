class Tweet < ApplicationRecord
	validates :user_id, presence: true
	validates :message, presence: true

	belongs_to :user

	default_scope -> {order(created_at: :desc)}
end
