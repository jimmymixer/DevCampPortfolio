class Portfolio < ApplicationRecord
  # Models should handle your logic instead of your controller

  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom Scope 1
  # Can use this in the portfolios controller
  def self.angular
    where(subtitle: 'Angular')
  end

  # Custom Scope 2
  # Can use this in the portfolios controller
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  # Callback
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x200"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
  
end
