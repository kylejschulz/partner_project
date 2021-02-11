require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'apartments/:id'" do
    it "Then I see a button to delete the parent" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"
        save_and_open_page

      expect(current_path).to eq("/apartments/#{apartment.id}")
      expect(page).to have_button("Delete Apartment")
    end

    it 'When I click the button "Delete Apartment"' do
      apartment = Apartment.create!({
        name: "Deleted Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"
        click_button "Delete Apartment"
        # response.should be_redirect (:action => 'index')
        expect(current_path).to eq("/apartments")
        expect(page).to have_no_content("Deleted Apartment")
    end
  end
end
