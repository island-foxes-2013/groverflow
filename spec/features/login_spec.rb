require 'spec_helper'

feature 'log in page' do
  let(:user) { FactoryGirl.create(:user) }


  scenario 'user visits the login page' do 
    visit login_path
    expect(page).to have_selector("form.login")
  end

  scenario 'user logs in' do
    visit login_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Log In'
    current_path.should eq root_path
  end
end
