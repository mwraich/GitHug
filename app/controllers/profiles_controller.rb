class ProfilesController < ApplicationController

  def index
    # @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @user = current_user
    @profile = Profile.find(current_user)
    # @tags = ActsAsTaggableOn::Tag.all
    # @tag = ActsAsTaggableOn::Tag.find(params[:id])
    # @profiles= Profile.tagged_with(@tag.name)
  end

  def new
    @profile = Profile.new
    @profile.images.build

    @profile.user_id = current_user

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user

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
  end

  def tagged
    if params[:tag].present?
      @profiles = Profile.tagged_with(params[:tag])
    else
      @profiles = Profile.all
    end
  end
  # def profile_params
  #     params.require(:profile).permit( :name, :tag_list)
  # end

  private

    def profile_params
      params.require(:profile)
            .permit(:first_name, :last_name, :location, :male, :female, :other,
            :birthday, :opperating_system, :about_me, :tag_list, languages_attributes:
            [:id, :language, :skill_level], images_attributes: [:id, :image, :image_cache])
    end

end
