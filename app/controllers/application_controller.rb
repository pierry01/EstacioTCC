class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :layout_by_resource
  
  protect_from_forgery with: :null_session
  
  private
  
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'backoffice_devise'
    elsif devise_controller? && resource_name == :user
      'site'
    else
      'application'
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
  end
end
