class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validates data entered into database
  validates_presence_of :title, :body

  belongs_to :topic

  # scopes called in the controllers
  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

end
