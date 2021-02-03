class Apartment < ApplicationRecord
  validates_presence_of :name, :years_old, :units

  has_many :tenant
end
