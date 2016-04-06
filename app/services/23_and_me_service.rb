class 23AndMeService
  def initialize
    @token = get_token
    @headers = {
      "Authorization: Bearer #{@token}"
    }
    @host = "https://api.23andme.com/token"
  end

  def get_token

  end

  uri = URI("https://api.23andme.com/token")
    param_code = params[:code]
    token_params = {
      "client_id" => "fa14c16e8d247c33723730c697802dd9",
      "client_secret" => "0ff970b94a7ccdd3f44f5490787ea788",
      "grant_type" => "authorization_code",
      "code" => param_code,
      "redirect_uri" => "http://localhost:3000/receive_code",
      "scope" => "basic haplogroups email ancestry",
    }

    response = JSON.parse(Net::HTTP.post_form(uri, token_params).body)
    token = response["access_token"]
end
