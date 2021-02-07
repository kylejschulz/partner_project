class RemoveYearlyMembershipFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :yearly_membership, :boolean
  end
end
