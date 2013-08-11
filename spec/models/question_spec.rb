# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Question do
  it { should be_a Question }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should have_many(:answers) }

    context "#new" do
      before(:all) { @question = create(:question)}
      subject { @question }

      it { should be_a Question }
      its(:id) {should be}
    end

end
