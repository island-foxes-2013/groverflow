require 'spec_helper'

feature 'when creating an answer' do
  let(:question) { create(:question) }
  let(:answer) { create(:answer) }

  before(:all) { log_in }

  before(:each) { visit question_path(question) }

  scenario "user visits the question's page" do    
    save_and_open_page
    expect(page).to have_content "Submit an answer"
  end
end
