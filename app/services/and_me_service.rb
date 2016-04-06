class AndMeService
  def initialize(params)
    @param_code = params["code"]
    @host = "https://api.23andme.com/token"
    @token = get_token
    @headers = { "Authorization" => "Bearer #{@token}" }
  end

  def get_token
    response = Net::HTTP.post_form(URI(@host), token_params).body
    token = JSON.parse(response)["access_token"]
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
  private

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
