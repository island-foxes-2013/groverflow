class CommentsController < ApplicationController

  def create
    ap params
    if params[:question_id]
      commentable = Question.find(params[:question_id])
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
    end

    @comment = Comment.create(user:       current_user,
                              commentable: commentable,
                              content:     params[:comment][:content])
    ap "HELLLLO"
    ap @comment
    ap commentable
    if @comment.errors.any? 
      flash[:comment_errrors] = @comment.errors.full_messages
    end
    if params[:question_id]
      redirect_to question_path(commentable)
    else
      redirect_to root_path
    end
    
  end

end
