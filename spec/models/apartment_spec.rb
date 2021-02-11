require 'rails_helper'

describe Apartment, type: :model do
  describe 'relationships' do
    it {should have_many :tenant}
  end

  describe 'attributes' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_old}
    it {should validate_presence_of :units}
    it {should validate_inclusion_of :luxury}
  end

  describe 'class method' do
    it 'Sort apartments by created_at' do
      @apartment_1 = Apartment.create!(name: 'Salt Lake name',
                                    years_old: 40000,
                                    units: 50,
                                    luxury: true)
      @apartment_2 = Apartment.create!(name: 'Seattle',
                                    years_old: 35000,
                                    units: 70,
                                    luxury: true)
      @apartment_3 = Apartment.create!(name: 'Dallas',
                                    years_old: 25000,
                                    units: 49,
                                    luxury: false)

      expect(Apartment.sort_recent.length).to eq([@apartment_1, @apartment_2, @apartment_3].length)
    end
  end

    it 'Counts number of tenants' do
      @apartment_1 = Apartment.create!(name: 'Salt Lake name',
                                    years_old: 40000,
                                    units: 50,
                                    luxury: true)
      @tenant_1 = Tenant.create!(name: 'Bob',
                                 on_strike: true,
                                 age: 20,
                                 apartment_id: @apartment_1.id)
      @tenant_2 = Tenant.create!(name: 'Sal',
                                 on_strike: true,
                                 age: 67,
                                 apartment_id: @apartment_1.id)
      @tenant_3 = Tenant.create!(name: 'Betty',
                                 on_strike: false,
                                 age: 68,
                                 apartment_id: @apartment_1.id)

      expect(@apartment_1.tenant_count).to eq(3)
    end

    it 'sorts tenants alphabetically' do
      @apartment_1 = Apartment.create!(name: 'Salt Lake name',
                                    years_old: 40000,
                                    units: 70,
                                    luxury: true)
      @tenant_1 = Tenant.create!(name: 'AAA',
                                 on_strike: true,
                                 age: 29,
                                 apartment_id: @apartment_1.id)
      @tenant_2 = Tenant.create!(name: 'BBB',
                                 on_strike: true,
                                 age: 19,
                                 apartment_id: @apartment_1.id)
      @tenant_3 = Tenant.create!(name: 'CCC',
                                 on_strike: false,
                                 age: 63,
                                 apartment_id: @apartment_1.id)
      expect(@apartment_1.sort_alpha).to eq([@tenant_1, @tenant_2, @tenant_3])
    end
    it 'sorts by people by age' do
      @apartment_1 = Apartment.create!(name: 'Salt Lake name',
                                    years_old: 40000,
                                    units: 40,
                                    luxury: true)
      @tenant_1 = Tenant.create!(name: 'AAA',
                                 on_strike: true,
                                 age: 29,
                                 apartment_id: @apartment_1.id)
      @tenant_2 = Tenant.create!(name: 'BBB',
                                 on_strike: true,
                                 age: 61,
                                 apartment_id: @apartment_1.id)
      @tenant_3 = Tenant.create!(name: 'CCC',
                                 on_strike: false,
                                 age: 18,
                                 apartment_id: @apartment_1.id)
      @tenant_4 = Tenant.create!(name: 'DDD',
                                 on_strike: true,
                                 age: 18,
                                 apartment_id: @apartment_1.id)

      expect(@apartment_1.sort(19)).to eq([@tenant_1, @tenant_2])
    end
end
