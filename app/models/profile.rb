class Profile < ApplicationRecord
	validates :user_id, presence: true, uniqueness: true
	belongs_to :user
	has_one_attached :picture
	has_one_attached :background_picture

	validates :picture, file_content_type: {
		allow: ["image/jpeg", "image/png", "image/jpg"],
		if: -> { picture.attached? },
	}

	validates :background_picture, file_content_type: {
		allow: ["image/jpeg", "image/png", "image/jpg"],
		if: -> { background_picture.attached? },
	}

	# so
	def snippet_fields
		attributes.select { |field_name, val| ["birthday", "website", "bio", "location"].member?(field_name) && !val.blank? }
	end
end
