class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_profile , :current_user
  # layout :set_layout
  # before_action :check_visiter

  def current_profile
    @profile ||= current_user.profile.decorate
  end

  def current_user
    @admin_user ||= AdminUser.first
  end

  private

  # def set_layout
  #   current_profile.layout_name
  # end

  def check_visiter
    puts "Location: "
    puts "IP: #{request.ip}"
    puts "country_code: #{request.country_code}"
    puts "country_name: #{request.country_name}"
    puts "region_code: #{request.region_code}"
    puts "region_name: #{request.region_name}"
    puts request.location
  end

end
