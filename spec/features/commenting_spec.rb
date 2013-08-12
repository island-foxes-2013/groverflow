require 'spec_helper'

feature "Commenting" do
  before(:all) do 
    log_in
    @question = create(:question)
    @question_comment = create(:question_comment)
    @answer = create(:answer)
    @answer_comment = create(:answer_comment)
    @new_question_commnent = build(:question_comment)
    @new_answer_commnent = build(:answer_comment)
  end

  context "from a question thread page" do

    before(:each) do 
      log_in
      visit question_path(@question)
    end

    subject{page}

    it { should have_css ".question_comments" }
    it { should have_css ".answer_comments" }

    context "for question comments" do
      subject{page}
      it{ should have_field "comment_content"}
      it{ should have_button "Comment"}

      context "when valid comment is submitted" do
        before(:each) do
          fill_in "comment_content", with: @new_question_commnent.content
          click_button "Comment"
        end
        subject{page}

        it {should have_text @new_question_commnent.content}
        it {should have_text @new_question_commnent.user.username}

        it "should refresh the page" do
          expect(current_path).to eq question_path(@question)
        end

      end

      context "when empty comment is submitted" do
        before(:each) do
          click_button "Comment"
        end
        subject{page}

        it {should have_text "Content can't be blank"}

        it "should refresh the page" do
          expect(current_path).to eq question_path(@question)
        end

      end

    end
    
  end
    
end