class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.errors
      p "ERRORSSS!"
      @user.errors.full_messages.each {|msg| p msg}
      @errors = @user.errors.full_messages
      @user = User.new(params[:user])
      render new_user_path
    else
      p "NO ERRORS"
      redirect_to root_path
    end
  end

end
