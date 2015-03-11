class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:firstname, :lastname, :name, :phone_number, :description, :picture]
    devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname, :name, :phone_number, :description, :picture]
  end
end
