module Placeholder
  extend ActiveSupport::Concern

  # helper method / callback method
  # used in models/skill.rb + portfolio.rb in set_defaults method
  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
end
