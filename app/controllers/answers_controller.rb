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

  def answer_comments
    ap params
    params[:ids].each do |id|
      answer_obj = Answer.find(id)
      
      respond_to do |format|
        format.js { render partial: 'answers/answer_from', locals: { answer: answer_obj, answer_comment: Comment.new } }
      end
    end
  end

end
