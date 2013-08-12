require 'spec_helper'

feature "Single Question Thread View" do

  before(:all) do 
    log_in
    @question = create(:question)
  end

  before(:each) do 
    visit question_path(@question)
  end

  subject{page}

  it { should have_content @question.title }
  it { should have_content @question.user.username }
  it { should have_content @question.content }
  it { pending }#should have_css ".u-create"}
  it { pending }#should have_css "#question_votes .vote_count"}
  it { pending }#should have_css ".d-create"}

  scenario 'shows comments'

  context "has an answer form that" do
    scenario 'contains content field'

    context "when the submit button is pressed with no answer" do
      scenario "shows error to user"
    end

    context "when the submit button is pressed with an answer" do
      scenario "updates answer list at the top"
    end

  end

  context "can have an answer that" do

    scenario "contains answer content"

    scenario "shows author's username"

    scenario "shows date of posting"

    scenario "has upvote link"

    scenario "shows upvotes"

    scenario "has downvote link"

    scenario "shows downvotes"

    scenario "shows comments"

  end

end