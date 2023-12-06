class AddActiveToCrewMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :crew_members, :active, :boolean
  end
end
