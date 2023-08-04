# rubocop:disable all


class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Include CanCanCan to enable resource authorization
  include CanCan::ControllerAdditions

  protected

  def configure_permitted_parameters
    # Permit the required parameters for user sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :bio, :email, :password, :password_confirmation])
  end
end



