require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	describe "#index" do
		let(:user) {create(:user)}
		context "when a user is not logged in" do
			subject { get :index }
			it "returns a success response" do
				expect(subject).to be_success
			end
			it { should render_template('index') }
		end
		context "when a user is logged in" do 
			let (:user) {login_as(user)}
			subject { get :index }
			it "returns a success response" do
				expect(subject).to be_success
			end
			it { should render_template('index') }
		end
	end

end
