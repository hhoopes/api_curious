class NeanderthalService < AndMeApiService

  def neanderthal_info
    response = get("/neanderthal/#{current_user.and_me_id}")
    create_object(response)
  end

  private
    def create_object(hash)
      info = hash["neanderthal"]
      Neanderthal.new(info)
    end
end
