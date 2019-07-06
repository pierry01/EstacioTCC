class ApplicationController < ActionController::Base
  layout :layout_by_resource
  
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
end
