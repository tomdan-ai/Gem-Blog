class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Include CanCanCan to enable resource authorization
  include CanCan::ControllerAdditions

  respond_to :json

  protected

  def configure_permitted_parameters
    # Permit the required parameters for user sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio email password password_confirmation])
  end
end
