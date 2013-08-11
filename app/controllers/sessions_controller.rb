class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user = @user.authenticate(params[:user][:password])
      if @user
        self.current_user = @user
        redirect_to root_path
      else
        flash.now[:login_errors] = "Invalid email/password combo"
        render :new
      end
    else
      @user = User.new(params[:user])
      flash.now[:login_errors] = "Can't find that email!"
      render :new
    end
    
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
