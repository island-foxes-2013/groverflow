class Answer < ActiveRecord::Base
  validates :content, :best_answer, :user_id, :question_id , presence: true
  validates :question, associated: true
  belongs_to :user
  belongs_to :question
end
