class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    include CanCan::ControllerAdditions
  # before_action :require_login

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You do not have access to this page"

  before_action :has_profile

  def has_profile
    if current_user.profile.nil?
      redirect_to new_profile_path
    end
  end


end
