require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'apartments/:id'" do
    it "Then I see a link to delete the parent" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"

      expect(current_path).to eq("/apartments/#{apartment.id}")
      expect(page).to have_link("Delete Apartment")
    end

    it 'When I click the link "Delete Parent"' do
      apartment = Apartment.create!({
        name: "Deleted Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"
        click_link "Delete Apartment"
        response.should be_redirect (:action => 'index')
        expect(current_path).to eq("/apartments")
        expect(page).to not_have_content("Deleted Apartment")
    end
  end
end
