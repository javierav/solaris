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

ActiveRecord::Schema[7.1].define(version: 2023_08_05_174919) do
  create_table "archive", primary_key: "created_at", id: :datetime, force: :cascade do |t|
    t.float "solar_power", null: false
    t.float "solar_energy", null: false
    t.float "temperature", null: false
    t.float "grid_power", null: false
    t.float "grid_export", null: false
    t.float "grid_import", null: false
  end

  create_table "pvpc", primary_key: "datetime", id: :datetime, force: :cascade do |t|
    t.float "import"
    t.float "export"
  end

end
