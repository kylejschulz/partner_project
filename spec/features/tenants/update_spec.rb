require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a tenant show page" do
    it 'Has a link to update that Child "Update Child"' do
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: 1,
        on_strike: 'on'
        })

      visit "/tenants/#{tenant.id}"

      expect(current_path).to eq("/tenants/#{tenant.id}")
      expect(page).to have_link("Update Tenant")
    end

    it 'When I click the link Im taken to "/tenants/:id/edit"' do
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: 1,
        on_strike: 'on'
        })

        visit "/tenants/#{tenant.id}"
        click_link "Update Apartment"
        expect(current_path).to eq("/apartments/#{apartment.id}/edit")
    end

    it 'Page has a form to fill out with a Update Tenant button' do

        visit "/tenants/#{tenant.id}"
        click_link "Update Tenant"
        expect(page).to have_button("Update Tenant")
    end

    it 'Tenant is updated and redirected to "/tenants/:id"' do
      tenant_1 = Tenant.create!({
        name: "Jim jones",
        age: 22,
        apartment_id: 1,
        on_strike: 'on'
        })

      visit "/tenants/#{tenant.id}"
      click_link "Update Tenant"
      fill_in "tenant[name]", :with => "New Name"
      click_button("Update Tenant")
      expect(current_path).to eq("/tenants/#{tenant.id}")
      expect(page).to have_content("New name")
    end
  end
end

# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
