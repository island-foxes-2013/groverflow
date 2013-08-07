class User < ActiveRecord::Base
  attr_accessible :username, :email#, :password

  validates_presence_of :username, :email
  has_secure_password
end
