class ProfileService < AndMeApiService
  def picture_sm
    response = get("/profile_picture/#{current_user.and_me_id}")
    response["url_size_40_40"]
  end

  def picture_lg
    response = get("/profile_picture/#{current_user.and_me_id}")
    response["url_size_200_200"]
  end

  def maternal_haplogroup
    response = get("/haplogroups/#{current_user.and_me_id}")
    response["maternal"]
  end

  def paternal_haplogroup
    response = get("/haplogroups/#{current_user.and_me_id}")
    response["paternal"]
  end
end
