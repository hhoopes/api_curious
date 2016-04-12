class AndMeApiService
  attr_reader :host, :current_user, :post_headers

  def initialize(token, current_user = {})
    @current_user = current_user
    @host = "https://api.23andme.com/1"
    @headers = { "Authorization" => "Bearer #{token}" }
    @post_headers = @headers.merge({"Content-Type" => "application/json"})
  end

  def get(path)
    response = HTTMultiParty.get(@host + path, headers: @headers)
  end

  def post(path, params)
    binding.pry
    response = HTTMultiParty.post(
      @host + path,
      headers: post_headers,
      query: {
        :image => params
        })
        binding.pry
  end

  def prepare_params(params)
    JSON.generate(params)
  end

  private
    def parse(json_string)
      JSON.parse(json_string, symbolize_names: true)
    end
end
