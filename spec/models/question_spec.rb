require 'spec_helper'

describe Question do
  it { should be_a Question }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should have_many(:answers) }

    context "#new" do
      subject { FactoryGirl.build(:question) }

      it { should be_a Question }
      its(:title) { should eq FactoryGirl.attributes_for(:question)[:title] }
      its(:content) { should eq FactoryGirl.attributes_for(:question)[:content] }
      its(:user_id) { should eq FactoryGirl.attributes_for(:question)[:user_id] }
    end

end
