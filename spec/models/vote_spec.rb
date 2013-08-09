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

  let(:question_upvote) { create(:question_vote, value: 1) }
  let(:question_downvote) { create(:question_vote, value: -1) }

  let(:answer_upvote) { create(:answer_vote, value: 1) }
  let(:answer_downvote) { create(:answer_vote, value: -1) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:votable_id) }
  it { should validate_presence_of(:votable_type) }
  it { should validate_presence_of(:value) }

  describe "#new" do

    context "valid question upvote" do
      subject { question_upvote }
      it { should be_a Vote }
      its(:user) { should be_a User }
      its(:votable) { should be_a Question }
      its(:value) { should be 1 }
    end

    context "valid question downvote" do
      subject { question_downvote }
      it { should be_a Vote }
      its(:user) { should be_a User }
      its(:votable) { should be_a Question }
      its(:value) { should be -1 }
    end

    context "valid answer upvote" do
      subject { answer_upvote }
      it { should be_a Vote }
      its(:user) { should be_a User }
      its(:votable) { should be_a Answer }
      its(:value) { should be 1 }
    end

    context "valid answer upvote" do
      subject { answer_downvote }
      it { should be_a Vote }
      its(:user) { should be_a User }
      its(:votable) { should be_a Answer }
      its(:value) { should be -1 }
    end

    context

  end
  
end
