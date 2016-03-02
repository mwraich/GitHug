class UsersController < ApplicationController

  def index
    @users = if params[:search]
      User.where('LOWER(name) LIKE LOWER(?)', "%#{params[:search]}%")
    else
      User.all
    end
    respond_to do |format|
      format.html do
        if request.xhr?
          render @users
        else
          render :index
        end
      end
      format.js
    end
  end

  def show
    @user = User.find(current_user)
  end

  def update
  end

  def new
    @user = User.new(user_params)
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(current_user)

      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, profile:[:first_name,
                         :last_name, :location, :male, :female, :other,
                         :birthday, :opperating_system, :about_me])
  end

end
