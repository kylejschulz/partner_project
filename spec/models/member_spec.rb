require 'rails_helper'

RSpec.describe 'Member', type: :model do
  describe 'relationships' do
    it {should belong_to :location}
  end

  describe 'attributes' do
    it {should validate_presence_of :primary_member}
    it {should validate_presence_of :monthly_membership}
    it {should validate_presence_of :yearly_membership}
    it {should validate_presence_of :people_in_membership}
  end

  describe 'class method' do
    it 'has monthly membership' do
      @location_1 = Location.create(city: 'Salt Lake City',
                                 square_footage: 40000,
                                 lead_wall: true)
      @member_1 = Member.create!(primary_member: 'Bob',
                               monthly_membership: true,
                               people_in_membership: 2,
                               location_id: @location_1.id)
      @member_2 = Member.create!(primary_member: 'Sal',
                               monthly_membership: false,
                               people_in_membership: 1,
                               location_id: @location_1.id)

      expect(Member.has_membership.length).to eq(1)
    end


  end
end
