require 'rails_helper'

RSpec.describe User, type: :model do
  describe "find_or_create_with_auth" do
    it "creates a new user from user_info hash" do
      token     = "test user token"
      user_info = {:id=>111222333,
                   :first_name=>"Dirk",
                   :email=>"dirk@example.com"}
      expect(User.count).to eq(0)
      User.find_or_create_with_auth(token, user_info)
      expect(User.count).to eq(1)
      expect(User.first.first_name).to eq(user_info[:first_name])
      expect(User.first.email).to eq(user_info[:email])
      expect(User.first.access_token).to eq(token)
    end
  end
end
