require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'apartments/:id'" do
    it "Then I see the parent with that id including the parent's attributes:" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}"

      expect(current_path).to eq("/apartments/#{apartment.id}")
      expect(page).to have_content("Sweet Apartment")
      expect(page).to have_content("11")
      expect(page).to have_content("100")
      expect(page).to have_content("true")
    end
  end
end
