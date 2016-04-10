class UsersController < ApplicationController
  def neanderthal
    @neanderthal = NeanderthalService.new(current_user.access_token, current_user).neanderthal_info
  end
end
