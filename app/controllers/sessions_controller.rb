class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email])
      redirect_back_or_to(:root)
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(new_session_path)
  end
end
