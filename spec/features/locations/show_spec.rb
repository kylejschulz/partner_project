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

end
