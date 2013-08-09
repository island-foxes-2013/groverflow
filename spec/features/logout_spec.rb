require 'spec_helper'

describe 'log out' do
  let(:user) { create(:user) }

  context 'while on home page and logged in' do
    before do
      visit root_path
      log_in
    end  
    subject{page}

    it{should have_button("Logout")}

    it "should redirect home after logging out" do
      click_button("Logout")
      expect(current_path).to eq root_path
    end
  end
end
