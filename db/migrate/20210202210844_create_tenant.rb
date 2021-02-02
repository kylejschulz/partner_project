class CreateTenant < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :age
      t.string :apartment_building
      t.boolean :on_strike
      t.timestamps 
    end
  end
end
