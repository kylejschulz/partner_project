require 'rails_helper'

RSpec.describe 'new locations page', type: :feature do
  it 'follow a link to create new location' do
    visit '/locations'

    expect(page).to_not have_content("Salt Lake City")

    click_link 'New Location'

    expect(current_path).to eq('/locations/new')

    fill_in "location[city]", with: "Salt Lake City"
    fill_in "location[square_footage]", with: 40000
    fill_in "location[lead_wall]", with: true
    click_on 'Create Location'

    expect(current_path).to eq('/locations')
    expect(page).to have_content('Salt Lake City')
  end
end
