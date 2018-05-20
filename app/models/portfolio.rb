class Portfolio < ApplicationRecord
  # Models should handle your logic instead of your controller
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs ['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Setup mapping between in uploader and database
  # mount_uploader tells portfolio.rb that it needs to call carrierwave
  # uploader is going to apply it to the thumb_image
  # going to use the PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # Custom Scope 1
  # Can use this in the portfolios controller
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position # this is being called on in the portfolio_controller in the index action
    order("position ASC")
  end

  # Custom Scope 2
  # Can use this in the portfolios controller
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  # Callback
  after_initialize :set_defaults

  def set_defaults
    # self.main_image ||= "http://via.placeholder.com/600x200"
    # self.thumb_image ||= "http://via.placeholder.com/350x200"
    # Placeholder used for developement and not for production
    # Just to have something there to see the design of page
    # Placeholder will be moved to be used as a view helper
    self.main_image ||= Placeholder.image_generator(height: '600', width: '200')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

end
