class RenameTypeInPirateShips < ActiveRecord::Migration[7.0]
  def change
    rename_column :pirate_ships, :type, :ship_type
  end
end
