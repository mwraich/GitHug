class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user)
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully signed up for GitHug! Welcome!"
      auto_login(@user)
      redirect_to user_path
    else
      flash[:alert] = "Sorry, Signup failed. :( "
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
  
end
