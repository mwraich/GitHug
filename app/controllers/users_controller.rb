class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(current_user)
  end

  def update
  end

  def create
  end 

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
