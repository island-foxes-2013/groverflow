require 'spec_helper'

describe Question do
  # let(:question){FactoryGirl.new(:question)}

  describe "new" do

    context "when passed a title and content" do
      let(:question){FactoryGirl.build(:question)}

      it "should return an instance of question" do
        expect(question).to be_a Question
      end

      it "should have the correct title" do
        question.title.should eq FactoryGirl.attributes_for(:question)[:title]
      end

      it "should have the correct content" do
        question.content.should eq FactoryGirl.attributes_for(:question)[:content]
      end

      it "should have the correct user_id" do
        question.user_id.should eq 1
      end
    end

    context "when passed no arguments" do
      it "should raise an error on create when passed 0 arguments" do
        begin
          FactoryGirl.create(:question, title: nil, content: nil, user_id: nil)
        rescue Exception => e
          e.should be_a ActiveRecord::StatementInvalid
        end
        # expect { question }.to raise_error(ArgumentError)
        # p question.valid?
        # expect(question ).to be_a ActiveRecord::StatementInvalid
      end

    end

    context "when no title provided" do
      let(:question){FactoryGirl.build(:question, title: nil)}
      # subject(:question)
    end

    it "raises an error when no title provided"

    it "raises an error when no content provided"

    it ""


  end

  describe "save" do


  end

end
