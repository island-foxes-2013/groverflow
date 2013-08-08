class Answer < ActiveRecord::Base
  attr_accessible :content, :user, :best_answer

  validates :content, :best_answer, :user_id, :question_id , presence: true
  validates :question, associated: true
  belongs_to :user
  belongs_to :question
end
