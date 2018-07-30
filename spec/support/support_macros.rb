module SupportMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.build(:user)
      user.skip_confirmation!
      user.save
      sign_in user
    end
  end

  def register_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.build(:user)
      user.skip_confirmation!
      user.save
    end
  end
end