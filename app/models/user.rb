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

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password

  validates_presence_of :username, :email
  validates :email, email: true
  has_many :answers
  has_many :votes
  has_many :questions
  has_secure_password

end
