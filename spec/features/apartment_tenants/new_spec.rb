require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a '/apartments/:id/tenants'" do
    it "Then I see a link to create a new tenant, 'Create tenant'" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}/tenants"

      expect(current_path).to eq("/apartments/#{apartment.id}/tenants")
      expect(page).to have_link("Tenant listing page")
      expect(page).to have_link("Apartment listing page")
      expect(page).to have_link("Create tenant")
    end

    it "When I click the link I'm taken to '/apartments/:id/tenants/new'" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}/tenants"
      click_link "Create new tenant"
      expect(current_path).to eq("/apartments/#{apartment.id}/tenants/new")
    end

    it "When I fill out the form with a new tenants attributes:" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}/tenants/new"
      fill_in "tenant[name]", :with => "Shrewsbury Heights"
      fill_in "tenant[age]", :with => "6"
      check "tenant[on_strike]"
      click_button("Create new tenant")
    end

    it "Then a `POST` request is sent to the tenant' route," do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments/#{apartment.id}/tenants/new"

      fill_in "tenant[name]", :with => "Shrewsbury Heights"
      fill_in "tenant[age]", :with => "19"
      check "tenant[on_strike]"
      click_button("Create new tenant")

      expect(current_path).to eq("/apartments/#{apartment.id}/tenants")
      expect(page).to have_content("Shrewsbury Heights")
    end
  end
end
