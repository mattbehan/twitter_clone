require 'rails_helper'

RSpec.describe Following, type: :model do
	describe "basic validations" do
		it { should validate_presence_of(:followed_user_id) }
		it { should validate_presence_of(:following_user_id) }
		it { should validate_uniqueness_of(:follower_user_id).scoped_to(:following_user_id)}
	end
	describe "basic associations" do
		it {should belong_to(:follower)}
		it {should belong_to(:followed_user)}
	end

	describe "custom validations" do
		it "validates that a user cannot follow themselves" do
			user1 = create(user)
			following = Following.new(followed_user_id: user1.id, following_user_id: user1.id)
			following.valid?
			expect(following.errors).to include ("User cannot follow themselves")
		end
	end
end
