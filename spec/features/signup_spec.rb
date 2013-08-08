require 'spec_helper'

describe "user sign up" do

  context "from the homepage" do
    before do
      visit root_url
    end

    subject { page }

    it { should have_link("Signup") }

  end


end

it {should have_button('Create User')}

context "if proper signup information provided" do
  before do 
    fill_in 'Email', with email
    fill_in 'Username', with username
    fill_in 'Password', with password
    click_button 'Create User'
  end

  it "redirects to home page" do
    expect(current_path).to eq root_path
  end
end

context "if email blank" do
  before do 
    fill_in 'Username', with username
    fill_in 'Password', with password
    click_button 'Create User'
  end

  it "does not leave signup page" do
    expect(current_path).to eq new_user_path
  end

  it{should have_text("Email can't be blank")}
end

context "if username blank" do
  before do 
    fill_in 'Email', with email
    fill_in 'Password', with password
    click_button 'Create User'
  end

  it "does not leave signup page" do
    expect(current_path).to eq new_user_path
  end

  it{should have_text("Username can't be blank")}
end

context "if password blank" do
  before do 
    fill_in 'Email', with email
    fill_in 'Username', with username
    click_button 'Create User'
  end

  it "does not leave signup page" do
    expect(current_path).to eq new_user_path
  end

  it{should have_text("Password can't be blank")}
end