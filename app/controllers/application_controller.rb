class ApplicationController < ActionController::Base
  before_action :configure_parameter_permitted, if: :devise_controller?

  private

  def configure_parameter_permitted
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
