require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  it 'see the name of each parent record in the system' do
    location_1 = Location.create(city: 'Salt Lake City',
                                 square_footage: 40000,
                                 lead_wall: true)
    location_2 = Location.create(city: 'Seattle',
                                 square_footage: 35000,
                                 lead_wall: false)

    visit '/locations'

    expect(page).to have_link('Return to all members')

    expect(page).to have_content(location_1.city)
    expect(page).to have_content(location_2.city)
  end

  it 'can create new location' do
    visit '/locations'

    expect(page).to_not have_content("Salt Lake City")

    click_link 'New Location'

    expect(current_path).to eq('/locations/new')

    expect(page).to have_link('Return to all members')
    expect(page).to have_link('Return to all locations')

    fill_in "location[city]", with: "Salt Lake City"
    fill_in "location[square_footage]", with: 40000
    # fill_in "location[lead_wall]", with: true
    click_on 'Create Location'

    expect(current_path).to eq('/locations')
    expect(page).to have_content('Salt Lake City')
  end

  it 'follow a link to update location' do
    @location_1 = Location.create!(city: 'Salt Lake City',
                                   square_footage: 40000,
                                   lead_wall: true)

    visit '/locations'

    expect(page).to have_link('Update Location')

    click_link 'Update Location'

    expect(current_path).to eq("/locations/#{@location_1.id}/edit")

    expect(page).to have_link('Return to all members')
    expect(page).to have_link('Return to all locations')

    fill_in "location[city]", with: "SLC"
    click_on 'Update Location'

    expect(current_path).to eq("/locations/#{@location_1.id}")
    expect(page).to have_content('SLC')
  end

  it 'can delete location' do
    @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)

    visit '/locations'

    expect(page).to have_button('Delete Location')

    click_button 'Delete Location'

    expect(current_path).to eq('/locations')
    expect(page).to_not have_content(@location_1.city)
  end
end
