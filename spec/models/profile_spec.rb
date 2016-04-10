require 'rails_helper'

describe Profile do
  context "profile methods" do
    it "returns profile information" do
      VCR.use_cassette("profile methods") do
        user = create(:user)
        profile = Profile.new(user)

        image = profile.picture_sm
        expect(image).to eq("/user/default_tiny.png")

        lg_image = profile.picture_lg
        expect(lg_image).to eq("/user/default_small.png")

        expect(profile.maternal_haplogroup).to eq("U5b1")
        expect(profile.paternal_haplogroup).to eq("R1b1b2a1a1")
      end
    end
  end
end
