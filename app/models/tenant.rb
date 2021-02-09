class Tenant < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :age, :numericality => { :greater_than_or_equal_to => 18 }

  validates_inclusion_of :on_strike, :in => [true, false]

  belongs_to :apartment

  def self.on_strike
    # require "pry";binding.pry
    where(on_strike: true)
  end
end
