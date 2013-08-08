require 'spec_helper'

describe "user sign up" do

  context "from the homepage" do
    before do
      visit root_url
    end

    subject { page }

    it { should have_link("Signup") }

  end


end
