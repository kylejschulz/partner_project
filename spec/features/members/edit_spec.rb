require 'rails_helper'

RSpec.describe 'members edit page', type: :feature do
  it 'follow a link to update member' do
    @location_1 = Location.create!(city: 'Salt Lake City',
                                   square_footage: 40000,
                                   lead_wall: true)
    @member_1 = Member.create!(primary_member: 'Bob',
                               monthly_membership: true,
                               people_in_membership: 2,
                               location_id: @location_1.id)

    visit '/members'

    expect(page).to have_link('Update Member')

    click_link 'Update Member'

    expect(current_path).to eq("/members/#{@member_1.id}/edit")

    fill_in "member[primary_member]", with: "Mike"
    click_on 'Update Member'

    expect(current_path).to eq("/members/#{@member_1.id}")
    expect(page).to have_content('Mike')
  end
end
