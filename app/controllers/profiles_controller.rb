class ProfilesController < ApplicationController
  def show
    @user = current_user
    @profile = Profile.new(@user)
  end

  def edit
  end

  def update
  end
end
