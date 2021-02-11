require 'rails_helper'

RSpec.describe 'locations show page', type: :feature do
  it 'see the location with that id including the locations attributes' do
    @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000,lead_wall: true)
    @location_2 = Location.create!(city: 'Seattle', square_footage: 35000, lead_wall:false)

    visit "/locations/#{@location_1.id}"

    expect(page).to have_link('Return to all members')
    expect(page).to have_link('Return to all locations')
    expect(page).to have_link("Salt Lake City's members")

    expect(page).to have_content(@location_1.city)
    expect(page).to have_content(@location_1.square_footage)
    expect(page).to have_content(@location_1.lead_wall)

    visit "/locations/#{@location_2.id}"

    expect(page).to have_link('Return to all members')
    expect(page).to have_link('Return to all locations')
    expect(page).to have_link("Seattle's members")

    expect(page).to have_content(@location_2.city)
    expect(page).to have_content(@location_2.square_footage)
    expect(page).to have_content(@location_2.lead_wall)
  end

  it 'can update location from show page' do
    @location_1 = Location.create!(city: 'Salt Lake City',
                                   square_footage: 40000,
                                   lead_wall: true)

    visit "/locations/#{@location_1.id}"

    expect(page).to have_link('Update Location')
    click_link 'Update Location'

    expect(current_path).to eq("/locations/#{@location_1.id}/edit")

    fill_in "location[city]", with: "SLC"
    click_on 'Update Location'

    expect(current_path).to eq("/locations/#{@location_1.id}")
    expect(page).to have_content('SLC')
  end

  it 'can delete location from show page' do
    @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)

    visit "/locations/#{@location_1.id}"

    expect(page).to have_button('Delete Location')

    click_button 'Delete Location'

    expect(current_path).to eq('/locations')
    expect(page).to_not have_content(@location_1.city)
  end

  it 'can navigate to locations member page' do
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

    visit "/locations/#{@location_1.id}"

    expect(page).to have_link("#{@location_1.city}'s members")
    click_link "#{@location_1.city}'s members"

    expect(current_path).to eq("/locations/#{@location_1.id}/members")

    expect(page).to have_content(@member_1.primary_member)
    expect(page).to have_content(@member_2.primary_member)
  end
end
