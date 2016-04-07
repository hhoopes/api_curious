class UserService < AndMeApiService

  def and_me_id
    response = get("/user")
    response["id"]
  end

  def email
    response = get("/user/?email=true")
    response["email"]
  end

  private
end
