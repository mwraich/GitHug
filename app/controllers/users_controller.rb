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
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def update
    @user = User.find(params[:id])


    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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
      @user.build_profile
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name,
                          profile_attributes: [:id, :first_name, :last_name, :location,
                          :male, :female, :other, :birthday, :opperating_system,
                          :about_me], language_attributes: [:id, :language, :skill_level],
                          image_attributes: [:id, :image, :image_cache])
  end

end
