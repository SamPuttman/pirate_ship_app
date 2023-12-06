# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_06_010137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crew_members", force: :cascade do |t|
    t.bigint "pirate_ship_id", null: false
    t.string "name"
    t.integer "age"
    t.string "role"
    t.boolean "missing_limbs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["pirate_ship_id"], name: "index_crew_members_on_pirate_ship_id"
  end

  create_table "pirate_ships", force: :cascade do |t|
    t.string "name"
    t.string "ship_type"
    t.string "flag"
    t.integer "maximum_crew"
    t.boolean "sunk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "afloat"
  end

  add_foreign_key "crew_members", "pirate_ships"
end
