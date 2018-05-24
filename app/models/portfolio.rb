class Portfolio < ApplicationRecord
  # Models should handle your logic instead of your controller
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs ['name'].blank? }

  validates_presence_of :title, :body

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

end
