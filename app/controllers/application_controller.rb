class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Things in ApplicationController should be data specific

  # DeviseWhitelist is in controllers/concerns
  # DeviseWhitelist is for adding new table column in this case :name
  include DeviseWhitelist

  # SetSource is in the controllers/concerns, ex thank you for visit my from ..twitter
  include SetSource

  # Null Object Pattern OpenStruct, overriding current_user
  include CurrentUserConcern

  # Dynamic PageTitle
  include DefaultPageContent

  # Build your own gem
  before_action :set_copyright

  # Build your own gem
  def set_copyright
    @copyright = ParkViewTool::Renderer.copyright 'Jae Park', 'All rights reserved'
  end

end

module ParkViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
