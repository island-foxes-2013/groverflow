class QuestionsController < ApplicationController

 
  def new 
    @question = Question.new
  end

  def create
    redirect_to root_path
  end

end
