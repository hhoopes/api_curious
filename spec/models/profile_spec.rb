require 'rails_helper'

describe Profile do
  context "profile methods" do
    VCR.use_cassette("profile methods") do
      profile = Profile.new(ENV["USER_TOKEN"])

      it "returns a small profile picture" do
        image = profile.picture_sm
        expect(image).to eq("")
      end

      it "returns a large profile picture" do
        image = profile.picture_lg
        expect(image).to eq("")
      end

      it "returns user gender" do
        expect(profile.gender).to eq("F")
      end

      it "returns only a maternal haplogroup" do
        expect(profile.maternal_haplogroup).to eq("")
        expect(profile.paternal_haplogroup).to eq(nil)
      end
    end
  end
end
