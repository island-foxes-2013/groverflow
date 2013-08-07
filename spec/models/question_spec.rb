require 'spec_helper'

describe Question do
  # let(:question){FactoryGirl.new(:question)}

  describe "new" do

    context "when passed a title and content" do
      let(:question){FactoryGirl.build(:question)}

      it "should return an instance of question" do
        expect(question).to be_a Question
      end
      
    end

    context "when passed no arguments" do
      pending
    end

  end

  describe "save" do


  end

end