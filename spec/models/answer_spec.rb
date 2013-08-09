# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :string(255)      not null
#  best_answer :boolean          default(FALSE)
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Answer do
  it { should validate_presence_of :content }
  it { should validate_presence_of :best_answer }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :question_id }
  # it { pending; should validate_associated :user }
  # it { pending; should validate_associated :question }

  describe "#new" do

    context "when passed content, user_id, question_id" do
      let(:answer) { build(:answer) }

      it "should return an instance of answer" do
        expect(answer).to be_an Answer
      end
      
    end

    context "when passed no arguments" do
      it 'should throw an error' do
        expect { create(:invalid_answer) }.to raise_error
      end 
    end

  end


end
