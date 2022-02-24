class Conversation < ApplicationRecord
	validates :sender_id, uniqueness: {scope: :receiver_id}

	belongs_to :recipient, class_name: "User"
	belongs_to :sender
end
