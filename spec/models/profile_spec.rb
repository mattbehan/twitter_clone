require 'rails_helper'

RSpec.describe Profile, type: :model do
	describe "basic validations" do 
		it { should validate_presence_of(:user_id) }
	end
	describe "basic associations" do
		it {should belong_to(:user)}
	end
end
