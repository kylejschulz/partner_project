class Tenant < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :apartment
end
