class Location < ApplicationRecord
  has_many :members

  validates :city, presence: true, length: {minimum: 3, maximum: 50}
  validates :square_footage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates_inclusion_of :lead_wall, :in => [true, false]
end
