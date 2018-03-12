class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # DeviseWhitelist is in controllers/concerns
  include DeviseWhitelist

  # SetSource is in the controllers/concerns
  include SetSource
end
