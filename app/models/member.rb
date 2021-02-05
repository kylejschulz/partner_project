class Member < ApplicationRecord
  belongs_to :location

  validates_presence_of :primary_member, :monthly_membership, :yearly_membership, :people_in_membership
end
