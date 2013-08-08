class QuestionsController < ApplicationController
 
  def new 
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
    unless @question.errors.empty?
      @question.errors.full_messages.each {|msg| p msg}
      @errors = @question.errors.full_messages
      @question = Question.new(params[:question])
      render 'new'
    else
      redirect_to question_path(@question)
    end
  end
end
