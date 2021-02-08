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
      expect(page).to have_link("New Apartment")
    end

    it "When I click the link I'm taken to '/apartment/new'" do


      visit "/apartments"
      click_link "New Apartment"
      expect(current_path).to eq("/apartments/new")
    end

    it "When I fill out the form with a new parent's attributes:" do

      visit "/apartments/new"
      fill_in "apartment[name]", :with => "Shrewsbury Heights"
      fill_in "apartment[years_old]", :with => "6"
      fill_in "apartment[units]", :with => "54"
      fill_in "apartment[luxury]", :with => "on"
      click_button("Update Apartment")
    end

    it "Then a `POST` request is sent to the '/parents' route," do


      expect(current_path).to eq("/apartments")
      expect(page).to have_content("Shrewsbury Heights")
      expect(page).to have_content("6")
      expect(page).to have_content("54")
      expect(page).to have_content("true")
    end
  end
end





# And I click the button "Create Parent" to submit the form
# and I am redirected to the Parent Index page where I see the new Parent displayed.
