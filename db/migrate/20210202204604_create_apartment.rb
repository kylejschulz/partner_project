class CreateApartment < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :name
      t.integer :years_old
      t.integer :units
      t.boolean :luxury, :default => false
      t.timestamps
    end
  end
end
