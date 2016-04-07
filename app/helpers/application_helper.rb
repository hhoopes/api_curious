module ApplicationHelper
  def email_address(token)
    UserService.new(token).email
  end

  def first_name(token)
    UserService.new(token).first_name
  end
end
