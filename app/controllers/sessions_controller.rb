class SessionsController < ApplicationController
  def create
    token = AndMeAuthService.get_token(params[:code])
    if token
      session[:token] = token
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
