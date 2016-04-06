class SessionsController < ApplicationController
  def receive_code
    @user = AndMeService.new(params).find_user
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
