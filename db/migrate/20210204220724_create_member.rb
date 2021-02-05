class CreateMember < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :climbing_gym_id
      t.string :primary_member
      t.boolean :monthly_membership
      t.boolean :yearly_membership
      t.integer :people_in_membership
      t.timestamps
    end
  end
end
