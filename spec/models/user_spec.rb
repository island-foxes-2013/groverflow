# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  email           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:votes) }

  context "#new" do
    let(:user) { create(:user) }
    subject { user }
    it { should be_a User }

    it 'should have an encrpted password' do
      user.password_digest.should be_an_instance_of(BCrypt::Password)  #encryption method works
      user.password_digest.to_s.should_not eq user.password  #not storing the real password in the database
    end

  end

end
