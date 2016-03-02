class ProfilesController < ApplicationController

  def show
    @user = current_user
    @profile = Profile.find(@user.id)
  end

  def new
    @profile = Profile.new
    @profile.user_id = current_user

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user
    if @profile.save
      redirect_to users_path, notice: "Profile Saved!"
    else
      flash[:notice] = "Profile did not save. Please double check that all mandatory files have been filled out."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def profile_params
      params.require(:profile)
            .permit(:first_name, :last_name, :location, :male, :female, :other,
            :birthday, :opperating_system, :about_me)
    end
end
