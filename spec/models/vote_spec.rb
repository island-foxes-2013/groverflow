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

  let(:vote) { create(:vote) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:votable_id) }
  it { should validate_presence_of(:votable_type) }
  it { should validate_presence_of(:value) }

  describe "#new" do
    subject { vote }

    it { should be_a Vote }
  end
  
end
