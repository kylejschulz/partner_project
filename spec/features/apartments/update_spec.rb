require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a parent show page" do
    it 'Has a link to update Apartment' do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}"

      expect(current_path).to eq("/apartments/#{apartment.id}")
      expect(page).to have_link("Update Apartment")
    end

    it 'When I click the link Im taken to "/apartments/:id/edit"' do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"
        expect(page).to have_link("Tenant listing page")
        click_link "Update Apartment"
        expect(current_path).to eq("/apartments/#{apartment.id}/edit")
    end

    it 'Page has a form to fill out with a Update Apartment button' do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

        visit "/apartments/#{apartment.id}"
        click_link "Update Apartment"
        expect(page).to have_button("Update Apartment")
    end

    it 'Apartment is updated and redirected to "/apartments/:id"' do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}"

      click_link "Update Apartment"
      fill_in "apartment[name]", :with => "Whateva"
      click_button("Update Apartment")
      expect(current_path).to eq("/apartments/#{apartment.id}")
      expect(page).to have_content("Whateva")
    end
  end
end
