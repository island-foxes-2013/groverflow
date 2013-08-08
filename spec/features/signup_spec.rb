require 'spec_helper'

describe "user sign up" do

  context "from the homepage" do
    before do
      visit root_url
    end

    subject { page }

    it { should have_link("Signup") }

    it "has a correctly linked Signup link" do
      click_link("Signup")
      expect(current_path).to eq new_user_path
    end

  end

  context "from the signup page" do
    before do
      visit new_user_path
    end

    subject { page }

    it { should have_field("Username") }
    it { should have_field("Password") }
    it { should have_field("Email") }

    context "if an invalid email is submitted" do
      let(:username){Faker::Internet.user_name}
      let(:password){Faker::Internet.password}
      before do
        fill_in 'Email', with: "bademail"
        fill_in 'Username', with: username
        fill_in 'Password', with: password
        click_button 'Create User'
      end

      it "does not leave signup page" do
        expect(current_path).to eq new_user_path
      end

    end
  end
end
