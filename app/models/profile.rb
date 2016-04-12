class Profile < OpenStruct
  def initialize(user)
    @user = user
  end

  def service
    ProfileService.new(@user.access_token, @user)
  end

  def picture_sm
    service.picture_sm
  end

  def picture_lg
    service.picture_lg
  end

  def maternal_haplogroup
    service.maternal_haplogroup
  end

  def paternal_haplogroup
    service.paternal_haplogroup
  end

  def update_picture(file)
    response = service.change_picture(file) 
  end
end
