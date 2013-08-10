require 'spec_helper'

feature 'when creating a question' do
  let(:question) { create(:question) }

  # PLACEHOLDER: sign in
  before(:all) { log_in }

  before(:each) { visit new_question_path }

  scenario 'user fills in the create question form' do
    fill_in :question_title, with: question.title
    fill_in :question_content, with: question.content
    click_button 'Ask!'
  end

end

feature 'when viewing all questions' do

  # let!(:question) { create(:question) }
  before(:all) do
    log_in
    10.times do
      create(:question)
    end
  end

  let!(:question) { create(:question) }

  before(:each) { visit questions_path }

  scenario 'user visits the questions index page' do
    expect(page).to have_content "Questions for kids"
  end

  scenario 'user sees a list of question titles, and they are links' do 
    save_and_open_page
    expect(page).to have_link question.title
  end

  scenario 'user can click on a link and it takes to the question detail page, specifically' do
    click_link(question.title)
    current_path.should eq "/questions/#{question.id}"
  end

end

feature "when viewing one question's details" do

  before(:all) do 
    log_in
  end

  let!(:question) { FactoryGirl.create(:question) }
  let!(:user)     { FactoryGirl.create(:user) }

  scenario 'user wants to view the questions title, poster, and content' do
    question.user = user
    question.save
    visit question_path(question)
    expect(page).to have_content question.title
    expect(page).to have_content user.username
    expect(page).to have_content question.content
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
