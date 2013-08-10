class SessionsController < ApplicationController

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user = @user.authenticate(params[:user][:password])
      if @user
        self.current_user = user
        redirect_to root_path
      else
        flash.now[:login_errors] = "Invalid email/password combo"
      end
    else
      flash.now[:login_errors] = "Can't find that email!"
    end
    @user = User.new(params[:user])
    render :new
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
