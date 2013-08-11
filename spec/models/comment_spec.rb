# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Comment do

  let(:question_comment) { create(:question_comment) }

  let(:answer_comment) { create(:answer_comment) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:content) }
  it { should belong_to :user }
  it { should belong_to :commentable }

  describe "#new" do

    context "valid question comment" do
      subject { question_comment }
      it { should be_a Comment }
    end

    context "valid answer upcomment" do
      subject { answer_comment }
      it { should be_a Comment }
    end

  end
  
end
