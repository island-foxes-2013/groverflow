class CommentsController < ApplicationController

  def create
    if params[:question_id]
      commentable = Question.find(params[:question_id])
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
    end

    @comment = Comment.create(user:       current_user,
                              commentable: commentable,
                              content:     params[:comment][:content])
    if @comment.errors.any? 
      flash[:comment_errrors] = @comment.errors.full_messages
    end

    redirect_to question_path(commentable)
    
  end

end
