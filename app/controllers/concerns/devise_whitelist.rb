module DeviseWhitelist
  # This is a white list module
  # Name of this module has to be the same as the file name!
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

# Notes:
  # MODULE VS CLASS
    # - If it is rails specific like: ApplicationController, Model > it will be a class
    # - Like a helper piece of code, pass around and allow other classes to use it, it will be a module
    # - Think of modules of being modular
end
