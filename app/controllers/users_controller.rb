class UsersController < ApplicationController
  def create
    @user = User.new(params["code"])
    if @user
      session[:my_user] = @user
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
