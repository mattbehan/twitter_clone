require 'rails_helper'

RSpec.describe Following, type: :model do
	describe "basic validations" do
		it { should validate_presence_of(:followed_user_id) }
		it { should validate_presence_of(:following_user_id) }
		# necessary to test scoped uniqueness with shoulda matchers - see https://github.com/thoughtbot/shoulda-matchers/issues/745
		let(:user1) {create :user}
		let(:user2) {create :user}
		subject(:dup1) { Following.create(followed_user_id: user1.id, following_user_id: user2.id) }
		it "validates the uniqueness of followed_user_id and followed_user_id together to prevent duplicate records" do 
			should validate_uniqueness_of(:followed_user_id).scoped_to(:following_user_id)
		end
	end
	describe "basic associations" do
		it {should belong_to(:following_user)}
		it {should belong_to(:followed_user)}
	end

	describe "#user_cannot_follow_themself" do
		it "validates that a user cannot follow themself" do
			user1 = create(:user)
			following = Following.new(followed_user_id: user1.id, following_user_id: user1.id)
			following.valid?
			expect(following.errors.full_messages.flatten).to include ("Users cannot follow themselves")
		end
	end

	describe "#user_cannot_have_relevant_blocking" do
		let(:blocking) {create :blocking}
		it "validates that a following cannot exists if one user has blocked the other" do
			following = Following.new(followed_user_id: blocking.user_id, following_user_id: blocking.blocked_user_id)
			following.valid?
			expect(following.errors.full_messages.flatten).to include ("Users cannot follow other users if one has blocked the other")
		end
	end
end
