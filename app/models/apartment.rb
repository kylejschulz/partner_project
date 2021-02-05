class Apartment < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :years_old, :numericality => { :greater_than_or_equal_to => 0 }
  validates :units, :numericality => { :greater_than_or_equal_to => 0 }
  validates_inclusion_of :luxury, :in => [true, false]

  has_many :tenant
end
