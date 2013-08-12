require 'spec_helper'

feature "Commenting" do
  before(:all) {@comment = build(:question_comment)}

  context "from a question thread page" do
    before(:all) do 
      log_in
      @question = create(:question)
    end

    before(:each) do 
      log_in
      visit question_path(@question)
    end
    subject{page}

    it{ should have_field "comment_content"}
    it{ should have_button "Comment"}

    context "when valid comment is submitted" do
      before(:each) do
        fill_in "comment_content", with: @comment.content
        click_button "Comment"
      end
      subject{page}

      it {should have_text @comment.content}
      it {should have_text @comment.user.username}

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