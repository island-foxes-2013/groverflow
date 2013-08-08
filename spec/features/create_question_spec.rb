require 'spec_helper'

feature 'create_question' do
  let(:question) { build(:question) }

  # PLACEHOLDER: sign in
  before(:all) { log_in }

  scenario 'user visits the create question page' do
    visit new_question_path
    expect(page).to have_content "Create a Post"
    fill_in :question_title, with: question.title
    fill_in :question_content, with: question.content
    click_button 'Ask that shit'
  end

  scenario 

end




# feature 'log in page' do
#   let(:user) { create(:user) }

#   scenario 'user visits the login page' do 
#     visit login_path
#     expect(page).to have_selector("form.login")
#   end

#   scenario 'user logs in' do
#     log_in
#     current_path.should eq root_path
#   end
# end

  # fill_in :user_email, with: user.email
  # fill_in :user_password, with: user.password
