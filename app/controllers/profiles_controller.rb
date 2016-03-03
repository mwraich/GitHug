class ProfilesController < ApplicationController
  def index
    if params[:tag]
      @profiles = Profile.tagged_with(params[:id])
    else
      @articles = Article.all
  end

  def show
  end
end
