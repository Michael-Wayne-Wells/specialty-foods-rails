# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_admin_user
      if !current_user && !current_admin
        flash[:alert] = "You aren't authorized to visit that page."
        redirect_back(fallback_location: root_path)
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username email password_confirmation current_password])
  end
end
