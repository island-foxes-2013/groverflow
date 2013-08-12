class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end  

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    @question = current_user.questions.create(params[:question])
    if @question.errors.any?
      flash.now[:errors] = @question.errors.full_messages
      @question = Question.new(params[:question])
      render :new
    else
      redirect_to question_path(@question)
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    if logged_in?
      @question_vote = @question.votes.find_by_user_id(current_user.id)
    else
      @question_vote = nil
    end
    @question_comment = @question.comments.new
  end

end
