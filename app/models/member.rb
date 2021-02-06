class Member < ApplicationRecord
  belongs_to :location

  validates :primary_member, presence: true, length: {minimum: 3, maximum: 50}
  validates_inclusion_of :monthly_membership, :in => [true, false]
  validates_inclusion_of :yearly_membership, :in => [true, false]
  validates :people_in_membership, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
