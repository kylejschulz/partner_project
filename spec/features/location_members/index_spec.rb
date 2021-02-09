require 'rails_helper'

RSpec.describe 'locations members index page', type: :feature do
  it 'see each Child that is associated with that Parent with each Childs attributes' do
    @location_1 = Location.create!(city: 'Salt Lake City',
                                 square_footage: 40000,
                                 lead_wall: true)
    @location_2 = Location.create!(city: 'Seattle',
                                  square_footage: 25000,
                                  lead_wall: false)
    @member_1 = Member.create!(primary_member: 'Bob',
                               monthly_membership: true,
                               people_in_membership: 2,
                               location_id: @location_1.id)
    @member_2 = Member.create!(primary_member: 'Sal',
                               monthly_membership: true,
                               people_in_membership: 1,
                               location_id: @location_1.id)
    @member_3 = Member.create!(primary_member: 'Albert',
                               monthly_membership: false,
                               people_in_membership: 4,
                               location_id: @location_2.id)

    visit "/locations/#{@location_1.id}/members"
    expect(page).to have_content(@member_1.primary_member)
    expect(page).to have_content(@member_1.monthly_membership)
    expect(page).to have_content(@member_1.people_in_membership)

    expect(page).to have_content(@member_2.primary_member)
    expect(page).to have_content(@member_2.monthly_membership)
    expect(page).to have_content(@member_2.people_in_membership)

    expect(page).to_not have_content(@member_3.primary_member)
    expect(page).to_not have_content(@member_3.monthly_membership)
    expect(page).to_not have_content(@member_3.people_in_membership)
  end

end
