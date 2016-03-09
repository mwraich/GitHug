class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # before_action :require_login

  before_action :has_profile

  def has_profile
    if current_user.profile.nil?
      redirect_to new_profile_path
    end
  end

end 
end
