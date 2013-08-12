require 'spec_helper'

feature "Commenting" do
  before(:all) {@comment = build(:question_comment)}

  context "from a question thread page" do
    before(:all) do 
      log_in
      @question = create(:question)
    end

    before(:each) do 
      visit question_path(@question)
    end
    subject{page}

    it{ should have_field "comment_content"}

    context "when empty comment is submitted" do
      before(:each) do
        fill_in "comment_content", with: @comment.content
        click_button "Comment"
      end

      it "should refresh the page" do
        expect(current_path).to eq question_path(@question)
      end

      it "should show the comment"
    end

    context ""
  end
    
end