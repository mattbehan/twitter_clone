require 'rails_helper'

RSpec.describe User, type: :model do
	describe "validations" do 
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:handle) }
	end
	describe "associations" do
		it {should have_many(:tweets)}
		it {should have_many(:followed_users)}
		it {should have_many(:users_following)}
	end
end
