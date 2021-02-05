class AddLocationsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :location, foreign_key: true
  end
end
