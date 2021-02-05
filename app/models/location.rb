class Location < ApplicationRecord
  has_many :members

  validates_presence_of :city, :square_footage
  validates_inclusion_of :lead_wall, :in => [true, false]

end
