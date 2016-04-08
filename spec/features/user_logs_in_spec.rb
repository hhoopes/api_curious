require 'rails_helper'

RSpec.feature "user logs in", vcr: true do
  describe "User views name in navbar and greeting" do

    before do
      @user = create(:user)
    end

    it "allows user to view info when logged in" do
      VCR.use_cassette("sessions#create") do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit "/"
        expect(current_path).to eq("/")
        expect(page).to have_content(@user.first_name)
        expect(page).to have_content("Neanderthal Profile")
      end
    end
  end
end
