require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/tenants/:id" do
    it "Then I see the child with that id including the child's attributes:" do
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

      visit "/tenants/#{tenant_1.id}"
      save_and_open_page

      expect(page).to have_content("Jim Jones")
      # expect(page).to have_content("22")
      # expect(page).to have_content("#{apartment_1.id}")
    end
  end
end


# As a visitor
# When I visit '/child_table_name/:id'
