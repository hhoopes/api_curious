class User
  attr_reader :token, :service

  def initialize(code)
    @token ||= AndMeAuthService.get_token(code)
    @service = UserService.new(self)
  end

  def id
    service.and_me_id
  end

  def email
    service.email
  end
end
