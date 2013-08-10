class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end  

  def new 
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(params[:question])
    unless @question.errors.empty?
      @question.errors.full_messages.each {|msg| p msg}
      flash.now[:errors] = @question.errors.full_messages
      @question = Question.new(params[:question])
      render 'new'
    else
      redirect_to question_path(@question)
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

end
