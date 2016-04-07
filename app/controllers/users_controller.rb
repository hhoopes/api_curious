class UsersController < ApplicationController
  def ancestry
    if current_user
      service = AncestryService.new(@current_user.access_token)
      @presenter = AncestryPresenter.new(current_user, service)

    else
      redirect_to root_path
    end
  end
end
