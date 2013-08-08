class User < ActiveRecord::Base
  attr_accessible :username, :email#, :password

  validates_presence_of :username, :email
  has_many :answers
  has_many :questions
  has_secure_password
end
