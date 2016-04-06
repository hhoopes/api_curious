class AndMeOauthController < ApplicationController
  def receive_code
    AndMeService.new(params)
    # uri = URI("https://api.23andme.com/token")
    #   param_code = params[:code]
    #   token_params = {
    #     "client_id" => ENV["23_id"],
    #     "client_secret" => ENV["23_secret"],
    #     "grant_type" => "authorization_code",
    #     "code" => param_code,
    #     "redirect_uri" => "http://localhost:3000/receive_code",
    #     "scope" => "basic haplogroups email ancestry",
    #   }
    #
    #   response = JSON.parse(Net::HTTP.post_form(uri, token_params).body)
    #   token = response["access_token"]
      # call = `curl https://api.23andme.com/1/neanderthal/profile_id -H "Authorization: Bearer #{token}"`
      redirect_to root_path

  end
end
