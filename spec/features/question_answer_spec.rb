require 'spec_helper'

feature 'Answer creation' do
  let(:question) { create(:question) }
  let(:answer) { build(:answer) }
  before(:each) {log_in}

  context "from the question page" do
    before(:each) { visit question_path(question) }

    scenario "user sees an answer button" do    
      expect(page).to have_button "Answer"
    end

    context "when an answer is filled out" do
      before(:each) {fill_in :answer_content, with: answer.content}

      context "after clicking the submit button" do
        before(:each) {click_button "Answer"}

        scenario "user is redirected to question page" do
          expect(current_path).to eq question_path(question)
        end
      end

    end

    context "when an answer is not filled out" do

      context "after clicking the submit button" do
        before(:each) {click_button "Answer"}

        scenario "user is redirected to question page" do
          expect(current_path).to eq question_path(question)
        end

        scenario "user receives feedback on error" do
          expect(page).to have_content "Content can't be blank"
        end

      end

    end

  end

  
end
