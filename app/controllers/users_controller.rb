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
end
