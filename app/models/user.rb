class User < ActiveRecord::Base
  def self.find_or_create_with_auth(token, user_info)
    user =
    where(and_me_id: user_info[:profile_id]).first_or_create do |new_user|
      new_user.access_token  = token
      new_user.email         = user_info[:email]
      new_user.and_me_id     = user_info[:profile_id]
      new_user.first_name    = user_info[:first_name]
      new_user.last_name     = user_info[:last_name]
    end
    update_access_token(token)
    user
  end

  private
    def self.update_access_token(token)
      User.last.update(access_token: token)
    end
end
