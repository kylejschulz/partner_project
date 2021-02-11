require 'rails_helper'

RSpec.describe 'locations show page', type: :feature do
    it 'see the location with that id including the locations attributes' do
      @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)
      @location_2 = Location.create!(city: 'Seattle', square_footage: 35000, lead_wall: false)

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

    click_link 'New Location'

    expect(current_path).to eq('/locations/new')

    fill_in "location[city]", with: "Salt Lake City"
    fill_in "location[square_footage]", with: 40000
    check "location[lead_wall]"
    click_on 'Create Location'

    expect(current_path).to eq('/locations')
    expect(page).to have_content('Salt Lake City')
  end

  it 'follow a link to update location' do
    @location_1 = Location.create!(city: 'Salt Lake City',
                                   square_footage: 40000,
                                   lead_wall: true)

    visit "/locations/#{@location_1.id}"

    expect(page).to have_link('Update Location')
    click_link 'Update Location'

    expect(current_path).to eq("/locations/#{@location_1.id}/edit")
    save_and_open_page
    click_button 'Update location'
  end
end
