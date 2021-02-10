require 'rails_helper'

#do i need to create these children through the parents? or can i just manually create them by pulgging in the parent id?
RSpec.describe 'As a visitor' do
  describe "When I visit '/apartments/:id/tenants'" do
    it "Then I see each Child that is associated with that Parent with each Child's attributes:" do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
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
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })

      visit "/apartments/#{apartment_1.id}/tenants"

      expect(page).to have_link("Update Tenant")
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
