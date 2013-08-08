class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    redirect_to root_path
  end


end
