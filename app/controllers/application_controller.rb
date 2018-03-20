class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # DeviseWhitelist is in controllers/concerns
  # DeviseWhitelist is for adding new table column in this case :name
  include DeviseWhitelist

  # SetSource is in the controllers/concerns, ex thank you for visit my from ..twitter
  include SetSource

  # Null Object Pattern OpenStruct, overriding current_user
  include CurrentUserConcern

  # Dynamic PageTitle
  include DefaultPageContent

end
