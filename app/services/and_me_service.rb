class AndMeService
  def initialize(params)
    @param_code = params["code"]
    @host = "https://api.23andme.com/token"
    @access_token = ""
    @refresh_token = ""
    get_token
    @headers = { "Authorization" => "Bearer #{@access_token}" }
  end

  def find_user
    id_response = `curl https://api.23andme.com/1/user/?email=true -H "Authorization: Bearer #{@access_token}"`
    user_id = JSON.parse(id_response)["profiles"].first["id"]
      if User.find_by(and_me_id: user_id)
        binding.pry
        User.find_by(and_me_id: user_id)
      else
        @user = User.create(and_me_id: user_id, access_token: @access_token, refresh_token: @refresh_token)
        binding.pry
      end

  end

  # uri = URI("https://api.23andme.com/token")
  #   param_code = params[:code]
  #   token_params = {
  #     "client_id" => "fa14c16e8d247c33723730c697802dd9",
  #     "client_secret" => "0ff970b94a7ccdd3f44f5490787ea788",
  #     "grant_type" => "authorization_code",
  #     "code" => param_code,
  #     "redirect_uri" => "http://localhost:3000/receive_code",
  #     "scope" => "basic haplogroups email ancestry",
  #   }
  #
  #   response = JSON.parse(Net::HTTP.post_form(uri, token_params).body)
  #   token = response["access_token"]
  # call = `curl https://api.23andme.com/1/neanderthal/profile_id -H "Authorization: Bearer #{token}"`

  private

    def get_token
      response = Net::HTTP.post_form(URI(@host), token_params).body
      parsed  = JSON.parse(response)
      @access_token = parsed["access_token"]
      @refresh_token = parsed["refresh_token"]
      binding.pry
    end

    def token_params
      {
        "client_id" => ENV["23_id"],
        "client_secret" => ENV["23_secret"],
        "grant_type" => "authorization_code",
        "code" => @param_code,
        "redirect_uri" => "http://localhost:3000/receive_code",
        "scope" => "basic haplogroups email ancestry",
      }
    end
end
