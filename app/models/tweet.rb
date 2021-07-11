class Tweet < ApplicationRecord
	validates :user_id, presence: true
	validates :message, presence: true

	belongs_to :user

	default_scope -> { order(created_at: :desc) }
	scope :last_created, -> { where("created_at < ?", Time.now).first }
	scope :first_created, -> { last }
end
