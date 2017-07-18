# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170718172223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companions", force: :cascade do |t|
    t.string "compatible"
    t.string "combative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_companions_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "plant_type"
    t.string "name"
    t.string "sun_exposure"
    t.string "soil_ph"
    t.string "soil_type"
    t.string "soil_drainage"
    t.string "water_requirement"
    t.string "depth"
    t.string "row_spacing"
    t.string "plant_spacing"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "start_seed_indoors"
    t.string "plant_outdoors"
    t.string "spring_planting"
    t.string "fall_planting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id"
    t.bigint "zone_id"
    t.index ["plant_id"], name: "index_schedules_on_plant_id"
    t.index ["zone_id"], name: "index_schedules_on_zone_id"
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string "zip"
    t.string "phzone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "temp_range"
  end

  create_table "zones", force: :cascade do |t|
    t.string "main_zone"
    t.string "lowest_avg_temp_from"
    t.string "lowest_avg_temp_to"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "companions", "plants"
  add_foreign_key "schedules", "plants"
  add_foreign_key "schedules", "zones"
end
