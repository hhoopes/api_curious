class Profile < OpenStruct
  def initialize(current_user)
    @current_user = current_user
  end

  def self.service
    ProfileService.new(current_user.token)
  end

  def self.picture_sm
    service.picture_sm
  end

  def self.picture_lg
    service.picture_lg
  end

  def self.maternal_haplogroup
    service.maternal_haplogroup
  end

  def self.paternal_haplogroup
    service.paternal_haplogroup
  end
end
