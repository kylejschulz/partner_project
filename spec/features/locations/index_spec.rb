require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'locations index page', type: :feature do
  it 'can see the name of each parent in the system' do
    location_1 = Location.create!(city: 'Salt Lake City', square_footage: 40000, lead_wall: true)
    location_2 = Location.create!(city: 'Seattle', square_footage: 35000, lead_wall: false)

    visit '/locations'

    expect(page).to have_content(location_1.city)
    expect(page).to have_content(location_2.city)
    # expect(page).to have_content(location_1.square_footage)
    # expect(page).to have_content(location_2.square_footage)
    # expect(page).to have_content(location_1.lead_wall)
    # expect(page).to have_content(location_2.lead_wall)
  end

end
