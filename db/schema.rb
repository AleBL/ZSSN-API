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

ActiveRecord::Schema[7.1].define(version: 2020_01_05_021747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.integer "water"
    t.integer "food"
    t.integer "medication"
    t.integer "ammunition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "infected"
    t.bigint "inventory_id", null: false
    t.index ["inventory_id"], name: "index_people_on_inventory_id"
  end

  create_table "report_people", force: :cascade do |t|
    t.bigint "report_to_id", null: false
    t.bigint "report_from_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_from_id"], name: "index_report_people_on_report_from_id"
    t.index ["report_to_id"], name: "index_report_people_on_report_to_id"
  end

  add_foreign_key "people", "inventories"
  add_foreign_key "report_people", "people", column: "report_from_id"
  add_foreign_key "report_people", "people", column: "report_to_id"
end
