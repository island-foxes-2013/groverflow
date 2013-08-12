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
                       value:        params[:vote_value].to_i)

    render json: {errors:vote.errors, vote_count: votable.votes.sum(:value)}
  end

  def update
    p params
    if params[:question_id]
      votable = Question.find(params[:question_id])
      votable_id = params[:question_id]
      votable_type = "Question"
    elsif params[:answer_id]
      votable = Answer.find(params[:answer_id])
      votable_id = params[:answer_id]
      votable_type = "Answer"
    end

    vote = Vote.where(votable_id: votable_id, votable_type: votable_type).first
    p "vote: #{vote}"
    p "old vote value: #{vote.value}"
    vote.value = params[:vote_value].to_i
    p "params vote value: #{params[:vote_value].to_i}"
    p "vote value: #{vote.value}"
    vote.save
    render json: {errors:vote.errors, vote_count: votable.votes.sum(:value)}
  end

  def destroy
    p params
    if params[:question_id]
      votable = Question.find(params[:question_id])
      votable_id = params[:question_id]
      votable_type = "Question"
    elsif params[:answer_id]
      votable = Answer.find(params[:answer_id])
      votable_id = params[:answer_id]
      votable_type = "Answer"
    end

    vote = current_user.votes.where(votable_id: votable_id, votable_type: votable_type).first
    vote.destroy if vote
    render json: {errors:vote.errors, vote_count: votable.votes.sum(:value)}
  end

end
