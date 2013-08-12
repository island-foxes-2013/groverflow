require 'spec_helper'

feature 'log in page' do
  before(:all) {@user = create(:user)}

  context "from the login page" do
    before(:each) {visit login_path}
    subject{page}

    it {should have_css "form.login"}
    
    context "when visitor logs in correctly" do
      before(:each) do
        fill_in :user_email, with: @user.email
        fill_in :user_password, with: @user.password
        click_button 'Log In'
      end

      scenario "user is redirected to root" do
        current_path.should eq root_path
      end
    end

    context "when visitor logs in with invalid email" do
      before(:each) do
        fill_in :user_email, with: "aaaa@aaaa.com"
        fill_in :user_password, with: @user.password
        click_button 'Log In'
      end
      it {should have_text "Can't find that email!"}

      scenario "user is not redirected" do
        current_path.should eq "/sessions"
      end

    end

    context "when visitor logs in with invalid password" do
      before(:each) do
        fill_in :user_email, with: @user.email
        fill_in :user_password, with: "aaaaa"
        click_button 'Log In'
      end
      it {should have_text "Invalid email/password combo"}

      scenario "user is not redirected" do
        current_path.should eq "/sessions"
      end

    end

  end
end


