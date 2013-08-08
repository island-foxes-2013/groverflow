require 'spec_helper'

feature 'log in page' do
  let(:user) { create(:user) }

  scenario 'user visits the login page' do 
    visit login_path
    expect(page).to have_selector("form.login")
  end

  scenario 'user logs in' do
    log_in
    current_path.should eq root_path
  end
end
