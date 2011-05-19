class Api::UsersController < ApplicationController

  def index
    @users = User.all
    respond_with @users
  end
  
  def show
    @user = User.find_by_id(params[:id])
    respond_with @user
  end
  
end
