class AnswersController < ApplicationController

  # def index
  # end

  def create
    p params
    question = Question.find_by_id(params[:question_id])
    @answer = current_user.answers.new(params[:answer])
    question.answers << @answer
    @answer.save
    if @answer.errors.any?
      flash[:answer_errors] = @answer.errors.full_messages
      p @errors
    end
    redirect_to question_path(question)
  end

  # def destroy
  # end

  # def show
  # end

end
