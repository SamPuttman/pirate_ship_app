class AddAfloatToPirateShips < ActiveRecord::Migration[7.0]
  def change
    add_column :pirate_ships, :afloat, :boolean
  end
end
