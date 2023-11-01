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

ActiveRecord::Schema[7.1].define(version: 2023_10_31_072840) do
  create_table "archive", primary_key: "created_at", id: :datetime, force: :cascade do |t|
    t.float "solar_power", null: false
    t.float "solar_energy", null: false
    t.float "temperature", null: false
    t.float "grid_power", null: false
    t.float "grid_energy_export", null: false
    t.float "grid_energy_import", null: false
  end

  create_table "archive_daily_energy_price_export", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
    t.float "min", null: false
    t.datetime "mintime", null: false
    t.float "avg", null: false
  end

  create_table "archive_daily_energy_price_import", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
    t.float "min", null: false
    t.datetime "mintime", null: false
    t.float "avg", null: false
  end

  create_table "archive_daily_grid_energy_export", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
    t.float "sum", null: false
  end

  create_table "archive_daily_grid_energy_import", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
    t.float "sum", null: false
  end

  create_table "archive_daily_grid_power_export", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime"
  end

  create_table "archive_daily_grid_power_import", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime"
  end

  create_table "archive_daily_solar_energy", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
    t.float "sum", null: false
  end

  create_table "archive_daily_solar_power", primary_key: "date", id: :date, force: :cascade do |t|
    t.float "max", null: false
    t.datetime "maxtime", null: false
  end

  create_table "energy_price", primary_key: "datetime", id: :datetime, force: :cascade do |t|
    t.float "import"
    t.float "export"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone", default: "Europe/Madrid"
    t.integer "loop_interval", default: 30
    t.integer "archive_interval", default: 60
    t.string "energy_price"
    t.string "energy_price_at"
    t.string "esios_api_key"
    t.string "esios_zone"
    t.string "esios_country"
    t.string "inverter"
    t.string "huawei_ip"
    t.integer "huawei_port"
  end

end
