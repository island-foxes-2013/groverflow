require 'spec_helper'

feature 'Question Creation' do
  let(:question) { build(:question) }
  

  context "when not logged in" do

    scenario "user should be redirected to root" do
      expect{visit new_question_path}.to change{current_path}.to(root_path)
    end

  end


  context "when logged in" do
    before(:each) {log_in}

    context "has a landing page with a form" do
      before(:each){visit new_question_path}
      subject{page}

      it{should have_field "question_title"}
      it{should have_field "question_content"}
      it{should have_button "Ask!"}
      
      context "which, when filled validly" do

        it "should route to question's show page" do
          expect {
            fill_in :question_title, with: question.title
            fill_in :question_content, with: question.content
            click_button 'Ask!'
          }.to change{current_path}.to(/\/questions\/*/)
        end

      end

      context "which, when filled invalidly" do

        context "because of no title" do
          before(:each) do
            fill_in :question_content, with: question.content
            click_button 'Ask!'
          end

          it{should have_text "Title can't be blank"}

          it "should not redirect" do
            expect(current_path).not_to eq(/\/questions\/*/)
          end

        end

        context "because of no content" do
          before(:each) do
            fill_in :question_title, with: question.title
            click_button 'Ask!'
          end

          it{should have_text "Content can't be blank"}

          it "should not redirect" do
            expect(current_path).not_to eq(/\/questions\/*/)
          end
        end
      end

    end

  end

end
