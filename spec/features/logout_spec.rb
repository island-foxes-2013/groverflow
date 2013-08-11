require 'spec_helper'

describe 'log out' do
  let(:user) { create(:user) }

  context 'while on home page and logged in' do
    before do
      visit root_path
      log_in
    end  
    subject{page}

    it{should have_link("Logout")}

    it "should redirect home after logging out" do
      click_link("Logout")
      expect(current_path).to eq root_path
    end
  end
end
