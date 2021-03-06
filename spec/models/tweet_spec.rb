require 'rails_helper'

RSpec.describe Tweet, type: :model do
	describe "validations" do
		it { should validate_presence_of(:user_id) }
		it { should validate_presence_of(:message) }
	end
	describe "associations" do
		it {should belong_to(:user)}
	end

end
