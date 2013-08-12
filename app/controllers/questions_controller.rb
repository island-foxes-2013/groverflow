class QuestionsController < ApplicationController

  skip_before_filter :require_login, only: [:index, :show]

  def index
    # TODO-JW: consider pagination or something ...
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
      debugger
      flash.now[:errors] = "You had an error!"
      #@question = Question.new(params[:question])
      render :new
    else
      redirect_to question_path(@question)
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.answers.new
    @question.comments.new
    @question_vote = @question.votes.find_by_user_id(current_user.id) if logged_in?
  end

end
