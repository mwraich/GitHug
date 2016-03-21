class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @profile = current_user.profile
    @image = Image.new(image_params.merge(profile:@profile))


    if @image.save
      redirect_to profile_path(@profile)
    else
      render :new
    end

  end

  def destroy
    @image = Image.find(params[:id]).destroy
    flash[:success] = "Image deleted"
    redirect_to user_path
  end

end
