class Profile < ApplicationRecord
	validates :user_id, presence: true, uniqueness: true
	belongs_to :user

	has_attached_file :picture, styles: {
		thumb: '100x150>',
		square: '200x200#',
		medium: '300x300>'
	}, default_url: "/images/:style/missing.png"

	validates_attachment :picture,
		:content_type => { :content_type => /image/, :message => "Picture must be an image" },
		:file_name => { matches: [/png\z/, /jpe?g\z/, /jpg\z/, /JPG\z/, /PNG\z/], :message => "invalid. Supported extensions are: .png, .PNG, .jpeg, .jpg, .JPG" }
end
