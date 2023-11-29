class CreateCrewMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :crew_members do |t|
      t.references :pirate_ship, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :role
      t.boolean :missing_limbs

      t.timestamps
    end
  end
end
