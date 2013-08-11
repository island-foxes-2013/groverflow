# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  votable_id   :integer
#  votable_type :string(255)
#  value        :integer
#

require 'spec_helper'

describe Vote do

  let(:question_vote) { create(:question_vote) }

  let(:answer_vote) { create(:answer_vote) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:votable_id) }
  it { should validate_presence_of(:votable_type) }
  it { should validate_presence_of(:value) }
  it { should belong_to :user }
  it { should belong_to :votable }

  describe "#new" do

    context "valid question vote" do
      subject { question_vote }
      it { should be_a Vote }
    end

    context "valid answer upvote" do
      subject { answer_vote }
      it { should be_a Vote }
    end

  end
  
end
