require "rails_helper"

describe User, :type => :model do

  it "user without email is invalid" do
    @user = FactoryGirl.build(:user, email: "")
    expect(@user).not_to be_valid
  end

  it "invalid password rejected" do
    @user = FactoryGirl.build(:user, password: "12")
    expect(@user).not_to be_valid
  end
end
