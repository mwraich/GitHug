class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if @user = login(params[:email])
      redirect_to profiles_path
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(new_session_path)
  end
end
