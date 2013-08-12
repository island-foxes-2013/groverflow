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
    let(:username){Faker::Internet.user_name}
    let(:password){Faker::Internet.password}
    let(:email){ "jesseclay@gmail.com" }
    before do
      visit new_user_path
    end

    subject { page }

    it { should have_field("user_username") }
    it { should have_field("user_password") }
    it { should have_field("user_email") }
    it {should have_button('Signup')}

    context "if an invalid email is submitted" do
      
      before do
        fill_in 'user_email', with: "bad_email"
        fill_in 'user_username', with: username
        fill_in 'user_password', with: password
        click_button 'Signup'
      end

      it "goes to /users" do
        pending
        expect(current_path).to eq '/users'
      end

      it "has user fields filled in with previously submitted data" do
        pending
        expect(find_field('user_email').value).to eq "bad_email"
        expect(find_field('user_username').value).to eq username
      end

    end

    context "if proper signup information provided" do
      before do 
        fill_in 'user_email', with: email
        fill_in 'user_username', with: username
        fill_in 'user_password', with: password
        click_button 'Signup'
      end

      it "redirects to home page" do
        expect(current_path).to eq root_path
      end
    end

    context "if email blank" do
      before do 
        fill_in 'user_username', with: username
        fill_in 'user_password', with: password
        click_button 'Signup'
      end

      it "does not leave signup page" do
        expect(current_path).to eq '/users'
      end

      it{should have_text("Email can't be blank")}
    end

    context "if username blank" do
      before do 
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        click_button 'Signup'
      end

      it "does not leave signup page" do
        expect(current_path).to eq '/users'
      end

      it{should have_text("Username can't be blank")}
    end

    context "if password blank" do
      before do 
        fill_in 'user_email', with: email
        fill_in 'user_username', with: username
        click_button 'Signup'
      end

      it "does not leave signup page" do
        expect(current_path).to eq '/users'
      end

      it{should have_text("Password digest can't be blank")}
    end

  end
end
