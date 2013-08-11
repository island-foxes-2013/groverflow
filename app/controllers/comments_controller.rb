class CommentsController < ApplicationController

  def create
    if params[:question_id]
      commentable = Question.find(params[:question_id])
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
    end

    comment = Comment.create(user:        current_user,
                             commentable: commentable,
                             content:     params[:comment_content])
    render json: { errors: comment.errors }
  end

end
