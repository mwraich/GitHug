class ProfilesController < ApplicationController
  before_action :verify_user, only: :show
  def index
    @profiles = if params[:search]
      Profile.search(params[:search]).order('profiles.created_at DESC')
    else
      Profile.order("profiles.created_at DESC")
    end
  end

  def show
    @user = current_user
    @profiles = Profile.all
    @profile = Profile.find(params[:id])
    @message = Message.new

    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    @profile.images.build
    @profile.user = current_user
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile Saved!"
    else
      flash[:notice] = "Profile did not save. Please double check that all mandatory fields have been filled out."
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end

  end

  def destroy
    @profile = current_user
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = "Image deleted"
    redirect_to user_path
  end

  def tagged
    if params[:tag].present?
      @profiles = Profile.tagged_with(params[:tag])
    else
      @profiles = Profile.all
    end
  end

  private

  def verify_user
    if Profile.find(params[:id]).blocked_by?(current_user)
      redirect_to :root, notice: "You have been blocked by this user"
    end
  end

  def profile_params
    params.require(:profile)
          .permit(:first_name, :last_name, :location, :male, :female, :other,
          :birthday, :operating_system, :about_me, :tag_list, languages_attributes:
          [:id, :language, :skill_level, :_destroy], images_attributes: [:id, :image,
          :image_cache, :_destroy, :remove_image])
  end

end
