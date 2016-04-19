class User < ActiveRecord::Base
  def self.from_omniauth(user_info)
    binding.pry
    where(and_me_id: user_info[:profile_id]).first_or_create do |new_user|
      new_user.access_token  = token
      new_user.email         = user_info[:email]
      new_user.and_me_id     = user_info[:profile_id]
      new_user.first_name    = user_info[:first_name]
    end
  end
end
