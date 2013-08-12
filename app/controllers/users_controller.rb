class UsersController < ApplicationController
  skip_before_action :require_login
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    if @user.errors.any?
      flash.now[:error] = @user.errors.full_messages
      render new_user_path
    else
      self.current_user = @user
      redirect_to root_path
    end
  end

end
