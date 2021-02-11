require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a tenant show page" do
    it 'Has a link to update that Child "Update Tenant"' do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })

      visit "/tenants/#{tenant_1.id}"

      expect(current_path).to eq("/tenants/#{tenant_1.id}")
      expect(page).to have_link("Update Tenant")
    end

    it 'When I click the link Im taken to "/tenants/:id/edit"' do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })

        visit "/tenants/#{tenant_1.id}"

        click_link "Update Tenant"
        expect(current_path).to eq("/tenants/#{tenant_1.id}/edit")
    end

    it 'Page has a form to fill out with a Update Tenant button' do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })

        visit "/tenants/#{tenant_1.id}"
        click_link "Update Tenant"
        expect(page).to have_button("Update Tenant")
    end

    it 'Tenant is updated and redirected to "/tenants/:id"' do
      apartment_1 = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: apartment_1.id,
        on_strike: 'on'
        })

      visit "/tenants/#{tenant_1.id}"
      click_link "Update Tenant"

      expect(page).to have_link("Tenant listing page")
      fill_in "tenant[name]", :with => "New Name"
      click_button("Update Tenant")
      expect(current_path).to eq("/tenants/#{tenant_1.id}")
      expect(page).to have_content("New Name")
    end
  end
end
