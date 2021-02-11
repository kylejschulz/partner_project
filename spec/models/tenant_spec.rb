require 'rails_helper'

#
# RSpec.describe Client, type: :model do
#   subject { Client.new(f_name: 'first_name', l_name: 'last_name') }
#
#   it { should validate_presence_of(:f_name) }
# end


RSpec.describe Tenant, type: :model do
  describe 'relationships' do
    it {should belong_to :apartment}
  end

  describe 'attributes' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_inclusion_of :on_strike}
  end

  describe 'class method' do
    it 'can be on strike' do
      @apartment = Apartment.create(name: 'Salt Lake City',
                                 years_old: 40000,
                                 units: 100,
                                 luxury: true)
      @tenant_1 = Tenant.create!(name: 'Bob',
                               age: 30,
                               apartment_id: @apartment.id,
                                on_strike: true)
      @tenant_2 = Tenant.create!(name: 'Sal',
                               age: 29,
                               apartment_id: @apartment.id,
                                on_strike: false)

      expect(Tenant.on_strike.length).to eq(1)
    end


  end
end
