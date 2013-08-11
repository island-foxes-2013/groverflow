# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  user_id          :integer          not null
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :user, :commentable, :content, :commentable_type

  validates :user, :commentable_id, :commentable_type, :content, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true 
end
