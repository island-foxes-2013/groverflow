require 'spec_helper'

describe "thread list" do
  before do
    visit root_url
  end
  subject{page}

  it {should have_title("Groverflow")}
  it {should have_text("Groverflow")}
  it {should have_css("ul.questions_list")}
  it {should have_css("li.question")}

  # I think Capybara's matchers should figure this out
  it {should have_link("/question/")}

end