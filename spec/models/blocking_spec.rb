require 'rails_helper'

RSpec.describe Blocking, type: :model do
	let(:user1) {create(:user)}

	describe "basic validations" do
		it { should validate_presence_of(:user_id) }
		it { should validate_presence_of(:blocked_user_id) }
	end
	describe "basic associations" do
		it {should belong_to(:blocked_user)}
		it {should belong_to(:user)}
	end

	describe "#user_cannot_block_themself" do
		it "validates that a user cannot block themself" do
			blocking = Blocking.new(user_id: user1.id, blocked_user_id: user1.id)
			blocking.valid?
			expect(blocking.errors.full_messages.flatten).to include ("Users cannot block themselves")
		end
	end

	describe "#destroy_followings" do
		it "destroys the associated followings of the blocker and the blocked" do

		end
	end
end
