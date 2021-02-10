class Apartment < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :years_old, :numericality => { :greater_than_or_equal_to => 0 }
  validates :units, :numericality => { :greater_than_or_equal_to => 0 }
  validates_inclusion_of :luxury, :in => [true, false]

  has_many :tenant, dependent: :destroy

  def self.sort_recent
    all.order(:created_at).reverse
  end

  def member_count
    member.count
  end

  def sort_alpha
    tenant.order(:name)
  end

  def sort(params)
    tenant.where("age > ?", params)
  end
end
