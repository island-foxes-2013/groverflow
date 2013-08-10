class VotesController < ApplicationController

  def create
    votable_id = params[:question_id] || params[:answer_id]

    vote = Vote.create(user:         current_user, 
                       votable_type: params[:votable_type], 
                       votable_id:   votable_id, 
                       value:        params[:vote_value])

    render json: {errors:vote.errors}
  end

  def update
    votable_id = params[:question_id] || params[:answer_id]
    vote = current_user.votes.where(votable_id:   votable_id,
                                    votable_type: params[:votable_type]).first
    
    vote.value = params[:vote_value]
    vote.save
  end

  def destroy
    votable_id = params[:question_id] || params[:answer_id]
    vote = current_user.votes.where(votable_id:   votable_id,
                                    votable_type: params[:votable_type]).first
    vote.destroy if vote
  end

end
