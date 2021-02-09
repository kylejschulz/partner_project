require 'rails_helper'

RSpec.describe 'locations edit page', type: :feature do
    it 'follow a link to update location' do
      @location_1 = Location.create!(city: 'Salt Lake City',
                                     square_footage: 40000,
                                     lead_wall: true)

      visit '/locations'

      expect(page).to have_link('Update Location')

      click_link 'Update Location'

      expect(current_path).to eq("/locations/#{@location_1.id}/edit")

      fill_in "location[city]", with: "SLC"
      click_on 'Update Location'

      expect(current_path).to eq("/locations/#{@location_1.id}")
      expect(page).to have_content('SLC')
    end
end
