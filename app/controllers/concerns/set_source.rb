module SetSource
  # This is a set source module
  # Name of this module has to be the same as the file name!
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  # ex /portfolio/4?q=twitter
  # we can put twitter into session and be able to access it on all pages.
  # can implement "Thanks for visiting us from twitter", on application.html.erb
  def set_source
    session[:source] = params[:q] if params[:q]
  end

# Notes:
  # MODULE VS CLASS
    # - If it is rails specific like: ApplicationController, Model > it will be a class
    # - Like a helper piece of code, pass around and allow other classes to use it, it will be a module
    # - Think of modules of being modular
end
