# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :string(255)      not null
#  best_answer :boolean          default(FALSE)
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :content, :user, :best_answer

  validates :content, :best_answer, :user_id, :question_id , presence: true
  validates :question, associated: true
  belongs_to :user
  belongs_to :question
end
