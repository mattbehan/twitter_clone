require 'rails_helper'

RSpec.describe User, type: :model do
	describe "basic validations" do 
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:handle) }
	end
	describe "basic associations" do
		it {should have_many(:tweets)}
		
		it {should have_many(:followings_following)}
		it {should have_many(:followings_followers)}
		it {should have_many(:users_followed).through(:followings_following).source(:followed_user)}
		it {should have_many(:users_followers).through(:followings_followers).source(:following_user)}

		it {should have_many(:blockings)}
		it {should have_many(:blockings_blocked_users)}
		it {should have_many(:blocked_users).through(:blockings)}
		it {should have_many(:users_blocked_by).through(:blockings_blocked_users)}
	end
end
