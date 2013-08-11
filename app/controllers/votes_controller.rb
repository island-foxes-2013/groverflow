class VotesController < ApplicationController

  def create
    p params
    if params[:question_id]
      votable = Question.find(params[:question_id])
    elsif params[:answer_id]
      votable = Answer.find(params[:answer_id])
    end

    vote = Vote.create(user:         current_user, 
                       votable:      votable,
                       # votable_type: votable_type, 
                       # votable_id:   votable_id, 
                       value:        params[:vote_value])

    render json: {errors:vote.errors}
  end

  def update
    p params
    if params[:question_id]
      votable_id = params[:question_id]
      votable_type = "Question"
    elsif params[:answer_id]
      votable_id = params[:answer_id]
      votable_type = "Answer"
    end

    vote = current_user.votes.where(votable_id: votable_id, votable_type: votable_type).first
    vote.value = params[:vote_value]
    vote.save
    render json: {errors:vote.errors}
  end

  def destroy
    p params
    if params[:question_id]
      votable_id = params[:question_id]
      votable_type = "Question"
    elsif params[:answer_id]
      votable_id = params[:answer_id]
      votable_type = "Answer"
    end

    vote = current_user.votes.where(votable_id: votable_id, votable_type: votable_type).first
    vote.destroy if vote
    render json: {errors:vote.errors}
  end

end
