class SessionsController < ApplicationController
  def create
    token = AndMeAuthService.get_token(params[:code])
    if token
      session[:token] = token
      binding.pry
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
