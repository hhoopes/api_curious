class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def neanderthal
    @neanderthal = NeanderthalService.new(current_user.access_token, current_user).neanderthal_info
  end
end
