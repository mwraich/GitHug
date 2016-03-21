class OauthsController < ApplicationController
  skip_before_filter :require_login, :has_profile

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
       redirect_to profiles_path, :notice => "Logged in from #{provider.titleize}!"
    else
       @user = create_from(provider)
       UserMailer.delay.welcome_email(@user)
       reset_session # protect from session fixation attack
       auto_login(@user)
       redirect_to new_profile_path, :notice => "Account created from #{provider.titleize}!"

    end
  end


  private
  def auth_params
    params.permit(:code, :provider)
  end
end
