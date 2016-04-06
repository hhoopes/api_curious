class AndMeAuthService
  def self.get_token(code)
    response = Net::HTTP.post_form(URI("https://api.23andme.com/token"), token_params(code)).body
    parsed  = JSON.parse(response)
    refresh_token = parsed["refresh_token"]
    access_token = parsed["access_token"]    
  end

  private
    def self.token_params(code)
      {
        "client_id"         => ENV["23_id"],
        "client_secret"     => ENV["23_secret"],
        "grant_type"        => "authorization_code",
        "code"              => code,
        "redirect_uri"      => "http://localhost:3000/receive_code",
        "scope"             => "basic haplogroups email ancestry",
      }
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
