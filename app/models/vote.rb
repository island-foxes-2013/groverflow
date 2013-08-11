# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  votable_id   :integer
#  votable_type :string(255)
#  value        :integer
#

class Vote < ActiveRecord::Base

  attr_accessible :user, :votable, :value, :votable_type

  validates :user, :votable_id, :votable_type, :value, presence: true

  belongs_to :user
  belongs_to :votable, polymorphic: true 
end
