class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name work_hours projects_for_week break_time])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  protect_from_forgery with: :null_session
end
