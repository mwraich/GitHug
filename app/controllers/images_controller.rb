class ImagesController < ApplicationController

  def destroy
    @image = Image.find(params[:id]).destroy
    flash[:success] = "Image deleted"
    redirect_to user_path
  end

end
