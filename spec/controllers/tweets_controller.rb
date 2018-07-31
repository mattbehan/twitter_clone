require 'rails_helper'



RSpec.describe TweetsController, type: :controller do
	describe "#index" do
		context "when a user is not logged in" do
			subject { get :index }
			it "returns a success response" do
				expect(subject).to be_success
			end
			it { should render_template('index') }
		end
		context "when a user is logged in" do 
			let (:user) {login_user}
			subject { get :index }
			it "returns a success response" do
				expect(subject).to be_success
			end
			it { should render_template('index') }
		end
	end

	describe "#create" do
		
	end

end
