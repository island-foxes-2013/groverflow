require 'spec_helper'

feature "Single Question Thread View" do

  before(:all) do 
    log_in
    @question = create(:question)
    p @question
  end

  before(:each) do 
    visit question_path(@question)
  end

  scenario 'shows question title' do
    expect(page).to have_content @question.title
  end

  scenario "shows question's author" do
    expect(page).to have_content @question.user.username
  end

  scenario 'shows question content' do
    save_and_open_page
    expect(page).to have_content @question.content
  end

  scenario 'has upvote link' do
    find(".u-create").click
  end

  scenario 'shows upvotes'

  scenario 'has downvote link'

  scenario 'shows downvotes'

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