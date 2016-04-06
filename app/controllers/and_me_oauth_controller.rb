class AndMeOauthController < ApplicationController
  def receive_code
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
      # call = `curl https://api.23andme.com/1/neanderthal/profile_id -H "Authorization: Bearer #{token}"`
      redirect_to root_path

  end
end
