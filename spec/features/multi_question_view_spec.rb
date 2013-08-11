require 'spec_helper'

feature 'Multi-Question thread view' do
  before(:all) do
    log_in
    @test_question = create(:question)
    4.times do
      create(:question)
    end
  end

  before(:each) { visit questions_path }

  scenario 'shows the user an appropriate title' do
    expect(page).to have_content "Questions for kids"
  end

  scenario 'contains a list of titles, which are links' do 
    expect(page).to have_link @test_question.title
  end

  scenario 'has links to individual question thread pages' do
    click_link(@test_question.title)
    current_path.should eq "/questions/#{@test_question.id}"
  end

  context "under the 'recent' view" do

    scenario "displays the newest question at the top"

  end

  context "under the 'popular' view" do

    scenario "displays the most upvoted question at the top"

  end

  context "under the 'trending' view" do

  end

end

