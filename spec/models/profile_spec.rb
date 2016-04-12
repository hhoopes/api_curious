require 'rails_helper'

describe Profile do
  context "profile methods" do
    it "returns profile information" do
      VCR.use_cassette("profile methods") do
        user = create(:user)
        profile = Profile.new(user)

        image = profile.picture_sm
        expect(image).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_T.122_129_561_568.jpg")

        lg_image = profile.picture_lg
        expect(lg_image).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_M.122_129_561_568.jpg")

        expect(profile.maternal_haplogroup).to eq("U5b1")
        expect(profile.paternal_haplogroup).to eq("R1b1b2a1a1")
      end
    end
  end

  context ".update_picture" do
    it "updates the picture" do
      VCR.use_cassette("update picture") do
        user = create(:user)
        profile = Profile.new(user)

        expect(profile.picture_sm).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_T.122_129_561_568.jpg")
        expect(profile.picture_sm).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_T.122_129_561_568.jpg")

        new_pic = "spec/support/example.png"
        profile.update_picture(new_pic)

        expect(profile.picture_sm).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_T.122_129_561_568.jpg")
        expect(profile.picture_sm).to eq("https://www.23andmeobjects.com/photos///c0/2a/c02a6872e7e941feb64a50c1be410eb6_T.122_129_561_568.jpg")

      end
    end
  end
end
