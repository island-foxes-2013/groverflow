require 'spec_helper'

feature 'when creating a question' do
  let(:question) { build(:question) }

  # PLACEHOLDER: sign in
  before(:all) { log_in }

  before(:each) { visit new_question_path }

  scenario 'user visits the create question page' do
    expect(page).to have_content "Create a Post"
  end

  scenario 'user fills in the create question form' do
    fill_in :question_title, with: question.title
    fill_in :question_content, with: question.content
    click_button 'Ask that shit'
  end

end

feature 'when viewing all questions' do

  let!(:question) { create(:question) }

  before(:all) { log_in }

  before(:each) { visit questions_path }

  scenario 'user visits the questions index page' do
    expect(page).to have_content "Questions for kids"
  end

  scenario 'user sees a list of question titles, and they are links' do 
    expect(page).to have_link question.title
  end

  scenario 'clicked links will direct to specific question page' do
    click_link question.title
    expect(page).to have_content "question title"
  end

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
