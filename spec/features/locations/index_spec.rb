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

    expect(page).to have_content(location_1.city)
    expect(page).to have_content(location_2.city)
  end

  it 'see the location with that id including the locations attributes' do
    @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)
    @location_2 = Location.create!(city: 'Seattle', square_footage: 35000, lead_wall: false)

    visit "/locations/#{@location_1.id}"
    expect(page).to have_content(@location_1.city)
    expect(page).to have_content(@location_1.square_footage)
    expect(page).to have_content(@location_1.lead_wall)

    visit "/locations/#{@location_2.id}"
    expect(page).to have_content(@location_2.city)
    expect(page).to have_content(@location_2.square_footage)
    expect(page).to have_content(@location_2.lead_wall)
  end

  it 'can delete location' do
    @location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)

    visit '/locations'

    click_button 'Delete Location'

    expect(current_path).to eq('/locations')
    expect(page).to_not have_content(@location_1.city)
  end
end
