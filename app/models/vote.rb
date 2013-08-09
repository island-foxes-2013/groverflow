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
  validates_presence_of :user_id
  validates_presence_of :votable_id
  validates_presence_of :votable_type
  validates_presence_of :value
end
