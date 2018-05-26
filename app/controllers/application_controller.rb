class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_profile , :current_user

  def current_profile
    @profile ||= current_user.profile.decorate
  end

  def current_user
    @admin_user ||= AdminUser.first
  end
end
