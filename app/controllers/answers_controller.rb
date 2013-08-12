class AnswersController < ApplicationController

  def create
    question = Question.find_by_id(params[:question_id])
    @answer = current_user.answers.new(params[:answer])
    question.answers << @answer
    @answer.save
    if @answer.errors.any?
      flash[:answer_errors] = @answer.errors.full_messages
    end
    redirect_to question_path(question)
  end

end
