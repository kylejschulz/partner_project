class Location < ApplicationRecord
  has_many :member, dependent: :destroy

  validates :city, presence: true, length: {minimum: 3, maximum: 50}
  validates :square_footage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates_inclusion_of :lead_wall, :in => [true, false]

  def self.sort
    all.order(:created_at).reverse
  end

  def member_count
    member.count
  end

  def sort_alpha
    # require "pry";binding.pry
    member.order(:primary_member)
  end

  # def order(sql)
  #   member.order(sql)
  # end
  def sort(params)
    # require "pry";binding.pry
    member.where("people_in_membership > ?", params)
  end
end
