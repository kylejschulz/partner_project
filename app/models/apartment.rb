class Apartment < ApplicationRecord
  validates_presence_of :name, :age, :units, :luxury, :created_at, :updated_at

end
