class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null

  before_filter :configure_permitted_params, if: :devise_controller?

  layout :layout_by_resource

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit!
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      'plain'
    else
      'application'
    end
  end

end
