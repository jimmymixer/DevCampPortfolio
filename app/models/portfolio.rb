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

end
