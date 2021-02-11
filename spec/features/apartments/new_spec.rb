require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a '/apartments'" do
    it "Then I see a link to create a new apartment record, 'New Apartment'" do
      apartment = Apartment.create!({
        name: "Sweet Apartment",
        years_old: 11,
        units: 100,
        luxury: true
        })

      visit "/apartments"


      expect(current_path).to eq("/apartments")
      expect(page).to have_link("Tenant listing page")
      expect(page).to have_link("Apartment listing page")
      expect(page).to have_link("New Apartment")
    end

    it "When I click the link I'm taken to '/apartment/new'" do

      visit "/apartments"

      click_link "New Apartment"
      expect(current_path).to eq("/apartments/new")
    end

    it "When I fill out the form with a new apartment's attributes:" do

      visit "/apartments/new"

      fill_in "apartment[name]", :with => "Shrewsbury Heights"
      fill_in "apartment[years_old]", :with => "6"
      fill_in "apartment[units]", :with => "54"
      check "apartment[luxury]"
      click_button("New Apartment")
    end

    it "Then a `POST` request is sent to the '/parents' route," do
      visit "/apartments/new"
      fill_in "apartment[name]", :with => "Shrewsbury Heights"
      fill_in "apartment[years_old]", :with => "6"
      fill_in "apartment[units]", :with => "54"
      check "apartment[luxury]"
      click_button("New Apartment")


      expect(current_path).to eq("/apartments")
      expect(page).to have_content("Shrewsbury Heights")
    end
  end
end





# And I click the button "Create Parent" to submit the form
# and I am redirected to the Parent Index page where I see the new Parent displayed.
