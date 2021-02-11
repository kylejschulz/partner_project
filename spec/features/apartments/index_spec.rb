require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/apartments'" do
    it 'Then I see the name of each parent record in the system' do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        apartment_2 = Apartment.create!({
          name: "Other Sweet Apartment",
          years_old: 100,
          units: 50,
          luxury: true
          })

      visit "/apartments"

      expect(page).to have_content("Sweet Apartment")
      expect(page).to have_content("Other Sweet Apartment")
    end
  end
end
