require 'rails_helper'

describe Location, type: :model do
  describe 'relationships' do
    it {should have_many :member}
  end

  describe 'attributes' do
    it {should validate_presence_of :city}
    it {should validate_presence_of :square_footage}
    # it {should validate_presence_of :lead_wall}
  end

  describe 'class method' do
    it 'Sort locations by created_at' do
      @location_1 = Location.create!(city: 'Salt Lake City',
                                    square_footage: 40000,
                                    lead_wall: true)
      @location_2 = Location.create!(city: 'Seattle',
                                    square_footage: 35000,
                                    lead_wall: true)
      @location_3 = Location.create!(city: 'Dallas',
                                    square_footage: 25000,
                                    lead_wall: false)

      expect(Location.sort.length).to eq([@location_1, @location_2, @location_3].length)
    end
  end

    it 'Counts number of members' do
      @location_1 = Location.create!(city: 'Salt Lake City',
                                    square_footage: 40000,
                                    lead_wall: true)
      @member_1 = Member.create!(primary_member: 'Bob',
                                 monthly_membership: true,
                                 people_in_membership: 2,
                                 location_id: @location_1.id)
      @member_2 = Member.create!(primary_member: 'Sal',
                                 monthly_membership: true,
                                 people_in_membership: 1,
                                 location_id: @location_1.id)
      @member_3 = Member.create!(primary_member: 'Betty',
                                 monthly_membership: false,
                                 people_in_membership: 6,
                                 location_id: @location_1.id)

      expect(@location_1.member_count).to eq(3)
    end

    it 'sorts members alphabetically' do
      @location_1 = Location.create!(city: 'Salt Lake City',
                                    square_footage: 40000,
                                    lead_wall: true)
      @member_1 = Member.create!(primary_member: 'AAA',
                                 monthly_membership: true,
                                 people_in_membership: 2,
                                 location_id: @location_1.id)
      @member_2 = Member.create!(primary_member: 'BBB',
                                 monthly_membership: true,
                                 people_in_membership: 1,
                                 location_id: @location_1.id)
      @member_3 = Member.create!(primary_member: 'CCC',
                                 monthly_membership: false,
                                 people_in_membership: 6,
                                 location_id: @location_1.id)

      expect(@location_1.sort_alpha).to eq([@member_1, @member_2, @member_3])
    end
    it 'sorts by people in membership' do
      @location_1 = Location.create!(city: 'Salt Lake City',
                                    square_footage: 40000,
                                    lead_wall: true)
      @member_1 = Member.create!(primary_member: 'AAA',
                                 monthly_membership: true,
                                 people_in_membership: 2,
                                 location_id: @location_1.id)
      @member_2 = Member.create!(primary_member: 'BBB',
                                 monthly_membership: true,
                                 people_in_membership: 1,
                                 location_id: @location_1.id)
      @member_3 = Member.create!(primary_member: 'CCC',
                                 monthly_membership: false,
                                 people_in_membership: 6,
                                 location_id: @location_1.id)
      @member_4 = Member.create!(primary_member: 'DDD',
                                 monthly_membership: true,
                                 people_in_membership: 5,
                                 location_id: @location_1.id)

      expect(@location_1.sort(4)).to eq([@member_3, @member_4])
    end
end
