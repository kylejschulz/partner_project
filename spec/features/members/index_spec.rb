require 'rails_helper'

RSpec.describe 'members index page', type: :feature do
  describe 'When I visit members' do
    it 'see the name all members' do
      @location_1 = Location.create(city: 'Salt Lake City',
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

      visit '/members'

      expect(page).to have_content(@member_1.primary_member)
      # expect(page).to have_content(@member_1.monthly_membership)
      # expect(page).to have_content(@member_1.people_in_membership)

      expect(page).to have_content(@member_2.primary_member)
      # expect(page).to have_content(@member_2.monthly_membership)
      # expect(page).to have_content(@member_2.people_in_membership)
    end

    it 'see the member with that id including the members attributes' do
      @location_1 = Location.create(city: 'Salt Lake City',
                                 square_footage: 40000,
                                 lead_wall: true)
      @member_1 = Member.create!(primary_member: 'Bob',
                               monthly_membership: true,
                               people_in_membership: 2,
                               location_id: @location_1.id)
    # @member_2 = Member.create!(primary_member: 'Sal',
    #                            monthly_membership: false,
    #                            people_in_membership: 1)

     visit "/members/#{@member_1.id}"
     expect(page).to have_content(@member_1.primary_member)
     expect(page).to have_content(@member_1.monthly_membership)
     expect(page).to have_content(@member_1.people_in_membership)
   end
 end
end
