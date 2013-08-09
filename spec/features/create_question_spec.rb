require 'spec_helper'

feature 'lands on new question page' do
  
  let(:question) { build(:question) }

  # PLACEHOLDER: sign in
  before(:all) { log_in }

  scenario 'user visits the create question page' do
    visit new_question_path
    expect(page).to have_content "Create a Post"
  end
end

feature 'on submit' do  
  
  let(:question) { build(:question) }
  
  before(:each) do
    log_in
    visit new_question_path
  end
  
  scenario "when valid" do 
    fill_in :question_title, with: question.title
    fill_in :question_content, with: question.content
    click_button 'Ask that shit'
    expect(page).to have_content "question title"
  end
    
  scenario "when content invalid" do
    fill_in :question_title, with: question.title
    click_button 'Ask that shit'
    expect(page).to have_content "Content can't be blank"
  end

  scenario "when title invalid" do
    fill_in :question_content, with: question.content
    click_button 'Ask that shit'
    expect(page).to have_content "Title can't be blank"
  end
end
