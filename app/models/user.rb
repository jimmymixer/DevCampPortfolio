class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  # Since there is only name on the database via devisewhitelist, we need to implement first name and last name.
  # These are virtual attributes. first_name and last_name are not on the database.
  # Its taking in the 2 word name ex. Jimmy Park and splitting in to jimmy and park
  # Puts it into an array
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
