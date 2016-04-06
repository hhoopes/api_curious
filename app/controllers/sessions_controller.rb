class SessionsController < ApplicationController
  def receive_code
    @user = AndMeService.new(params).find_user
    binding.pry
  end
end
