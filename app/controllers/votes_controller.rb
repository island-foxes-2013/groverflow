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
    vote = Vote.where(user:         current_user,
                      votable_id:   params[:votable_id],
                      votable_type: params[:votable_type])
    
    vote.value = params[:vote_value]
    vote.save
  end

  def destroy
    Vote.where(user:         current_user,
               votable_id:   params[:votable_id],
               votable_type: params[:votable_type]).destroy
  end

end
