class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    user = @user.authenticate(params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "You. Made it."
    else
      flash.now.alert = "Invalid username or password"
      render :new
    end
  end

end
