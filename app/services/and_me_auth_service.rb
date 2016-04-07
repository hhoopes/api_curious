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
        "redirect_uri"      => "http://localhost:3000/auth/and_me/callback",
        "scope"             => "basic haplogroups email ancestry names",
      }
    end
end
