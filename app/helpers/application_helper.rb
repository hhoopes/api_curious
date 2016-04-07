module ApplicationHelper
  def email_address(token)
    UserService.new(token).email
  end
end
