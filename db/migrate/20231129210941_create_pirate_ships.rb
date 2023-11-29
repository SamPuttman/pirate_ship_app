class CreatePirateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :pirate_ships do |t|
      t.string :name
      t.string :type
      t.string :flag
      t.integer :maximum_crew
      t.boolean :sunk

      t.timestamps
    end
  end
end
