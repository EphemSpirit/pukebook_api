class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_premitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    end
end
