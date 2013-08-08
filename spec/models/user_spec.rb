require 'spec_helper'

describe User do

  let(:user) { create(:user) }
  # let(:user2) { User.create(username: 'clint', email: 'aasfhj@hajf.com', password: 'crackcrack')}

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  context "#new" do
    subject { user }
    it { should be_a User }
    its(:username) { should eq attributes_for(:user)[:username]}

    it 'should have an encrpted password' do
      user.password_digest.should eq "password"  #encryption method works
      user.password_digest.to_s.should_not eq "password" #not storing the real password in the database
    end

  end

end
