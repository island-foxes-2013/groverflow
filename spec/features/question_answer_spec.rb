feature 'when creating an answer' do
  let!(:question) { FactoryGirl.build(:question) }
  let(:answer) { FactoryGirl.build(:answer) }

  before(:all) { log_in }

  before(:each) { visit questions_path(@question) }

end
