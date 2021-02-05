class RemoveApartmentBuildingFromTenants < ActiveRecord::Migration[5.2]
  def change
    remove_column :tenants, :apartment_building, :string
  end
end
