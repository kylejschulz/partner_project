require 'rails_helper'

#do i need to create these children through the parents? or can i just manually create them by pulgging in the parent id?
RSpec.describe 'As a visitor' do
  describe "When I visit '/tenants'" do
    it 'Then I see the name of each tenant in the system' do
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
      tenant_1 = Tenant.create!({
        name: "Jim Jones",
        age: 22,
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })
      tenant_2 = Tenant.create!({
        name: "Alpha Blog",
        age: 34,
        apartment_id: apartment_2.id,
        on_strike: 'on'
        })



      visit "/tenants"

      expect(page).to have_link("Update Tenant")
      expect(page).to have_link("Tenant listing page")
      expect(page).to have_button("Delete Tenant")
      expect(page).to have_content("Jim Jones")
      expect(page).to have_content("22")
      expect(page).to have_content("true")
      expect(page).to have_content("Alpha Blog")
      expect(page).to have_content("34")
      expect(page).to have_content("true")
    end
  end
end
