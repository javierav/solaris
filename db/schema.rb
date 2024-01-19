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

ActiveRecord::Schema[7.1].define(version: 2024_01_09_182558) do
  create_table "archive", primary_key: "datetime", id: { type: :datetime, precision: 0 }, force: :cascade do |t|
    t.integer "solar_power", null: false
    t.decimal "solar_energy", precision: 4, scale: 2, null: false
    t.integer "grid_power", null: false
    t.decimal "grid_energy_export", precision: 8, scale: 2, null: false
    t.decimal "grid_energy_import", precision: 8, scale: 2, null: false
  end

  create_table "archive_daily_grid_energy_export", primary_key: "date", id: :date, force: :cascade do |t|
    t.decimal "max", precision: 8, scale: 2, null: false
    t.datetime "maxtime", null: false
    t.decimal "sum", precision: 8, scale: 2, null: false
  end

  create_table "archive_daily_grid_energy_import", primary_key: "date", id: :date, force: :cascade do |t|
    t.decimal "max", precision: 8, scale: 2, null: false
    t.datetime "maxtime", null: false
    t.decimal "sum", precision: 8, scale: 2, null: false
  end

  create_table "archive_daily_grid_power_export", primary_key: "date", id: :date, force: :cascade do |t|
    t.integer "max", null: false
    t.datetime "maxtime", null: false
  end

  create_table "archive_daily_grid_power_import", primary_key: "date", id: :date, force: :cascade do |t|
    t.integer "max", null: false
    t.datetime "maxtime", null: false
  end

  create_table "archive_daily_solar_energy", primary_key: "date", id: :date, force: :cascade do |t|
    t.decimal "max", precision: 4, scale: 2, null: false
    t.datetime "maxtime", null: false
    t.decimal "sum", precision: 8, scale: 2, null: false
  end

  create_table "archive_daily_solar_power", primary_key: "date", id: :date, force: :cascade do |t|
    t.integer "max", null: false
    t.datetime "maxtime", null: false
  end

  create_table "costs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id", null: false
    t.datetime "start_at", null: false
    t.decimal "transport_toll_p1", precision: 8, scale: 6, null: false
    t.decimal "distribution_toll_p1", precision: 8, scale: 6, null: false
    t.decimal "charges_p1", precision: 8, scale: 6, null: false
    t.decimal "transport_toll_p2", precision: 8, scale: 6, null: false
    t.decimal "distribution_toll_p2", precision: 8, scale: 6, null: false
    t.decimal "charges_p2", precision: 8, scale: 6, null: false
    t.decimal "transport_toll_p3", precision: 8, scale: 6, null: false
    t.decimal "distribution_toll_p3", precision: 8, scale: 6, null: false
    t.decimal "charges_p3", precision: 8, scale: 6, null: false
    t.index ["country_id"], name: "index_costs_on_country_id"
  end

  create_table "daily_energy_export_prices", id: false, force: :cascade do |t|
    t.string "type", null: false
    t.integer "zone_id", null: false
    t.date "date", null: false
    t.decimal "max", precision: 8, scale: 6, null: false
    t.datetime "maxtime", null: false
    t.decimal "min", precision: 8, scale: 6, null: false
    t.datetime "mintime", null: false
    t.decimal "avg", precision: 8, scale: 6, null: false
    t.index ["type", "zone_id", "date"], name: "index_daily_energy_export_prices_on_type_and_zone_id_and_date", unique: true
    t.index ["zone_id"], name: "index_daily_energy_export_prices_on_zone_id"
  end

  create_table "daily_energy_import_prices", id: false, force: :cascade do |t|
    t.string "type", null: false
    t.integer "zone_id", null: false
    t.date "date", null: false
    t.decimal "max", precision: 8, scale: 6, null: false
    t.datetime "maxtime", null: false
    t.decimal "min", precision: 8, scale: 6, null: false
    t.datetime "mintime", null: false
    t.decimal "avg", precision: 8, scale: 6, null: false
    t.index ["type", "zone_id", "date"], name: "index_daily_energy_import_prices_on_type_and_zone_id_and_date", unique: true
    t.index ["zone_id"], name: "index_daily_energy_import_prices_on_zone_id"
  end

  create_table "energy_periods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "monday", default: false, null: false
    t.boolean "tuesday", default: false, null: false
    t.boolean "wednesday", default: false, null: false
    t.boolean "thursday", default: false, null: false
    t.boolean "friday", default: false, null: false
    t.boolean "saturday", default: false, null: false
    t.boolean "sunday", default: false, null: false
    t.boolean "holiday", default: false, null: false
    t.integer "start_hour", null: false
    t.integer "end_hour", null: false
    t.string "name", null: false
  end

  create_table "energy_prices", id: false, force: :cascade do |t|
    t.string "type", null: false
    t.integer "zone_id", null: false
    t.datetime "datetime", null: false
    t.decimal "import", precision: 8, scale: 6, null: false
    t.decimal "export", precision: 8, scale: 6, null: false
    t.index ["type", "zone_id", "datetime"], name: "index_energy_prices_on_type_and_zone_id_and_datetime", unique: true
    t.index ["zone_id"], name: "index_energy_prices_on_zone_id"
  end

  create_table "holidays", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.string "name", null: false
    t.index ["date"], name: "index_holidays_on_date", unique: true
  end

  create_table "pvpc", primary_key: "datetime", id: { type: :datetime, precision: 0 }, force: :cascade do |t|
    t.decimal "import", precision: 8, scale: 6, null: false
    t.decimal "export", precision: 8, scale: 6, null: false
    t.decimal "factor", precision: 4, scale: 2, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inverter_id", null: false
    t.string "type", null: false
    t.datetime "start_at", null: false
    t.decimal "p1", precision: 8, scale: 6
    t.decimal "p2", precision: 8, scale: 6
    t.decimal "p3", precision: 8, scale: 6
    t.index ["inverter_id", "start_at"], name: "index_rates_on_inverter_id_and_start_at", unique: true
    t.index ["inverter_id"], name: "index_rates_on_inverter_id"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "var", null: false
    t.text "value"
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "solid_queue_blocked_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.string "concurrency_key", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.index ["expires_at", "concurrency_key"], name: "index_solid_queue_blocked_executions_for_maintenance"
    t.index ["job_id"], name: "index_solid_queue_blocked_executions_on_job_id", unique: true
  end

  create_table "solid_queue_claimed_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.bigint "process_id"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_claimed_executions_on_job_id", unique: true
    t.index ["process_id", "job_id"], name: "index_solid_queue_claimed_executions_on_process_id_and_job_id"
  end

  create_table "solid_queue_failed_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.text "error"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_failed_executions_on_job_id", unique: true
  end

  create_table "solid_queue_jobs", force: :cascade do |t|
    t.string "queue_name", null: false
    t.string "class_name", null: false
    t.text "arguments"
    t.integer "priority", default: 0, null: false
    t.string "active_job_id"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.string "concurrency_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_job_id"], name: "index_solid_queue_jobs_on_active_job_id"
    t.index ["class_name"], name: "index_solid_queue_jobs_on_class_name"
    t.index ["finished_at"], name: "index_solid_queue_jobs_on_finished_at"
    t.index ["queue_name", "finished_at"], name: "index_solid_queue_jobs_for_filtering"
    t.index ["scheduled_at", "finished_at"], name: "index_solid_queue_jobs_for_alerting"
  end

  create_table "solid_queue_pauses", force: :cascade do |t|
    t.string "queue_name", null: false
    t.datetime "created_at", null: false
    t.index ["queue_name"], name: "index_solid_queue_pauses_on_queue_name", unique: true
  end

  create_table "solid_queue_processes", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "last_heartbeat_at", null: false
    t.bigint "supervisor_id"
    t.integer "pid", null: false
    t.string "hostname"
    t.text "metadata"
    t.datetime "created_at", null: false
    t.index ["last_heartbeat_at"], name: "index_solid_queue_processes_on_last_heartbeat_at"
    t.index ["supervisor_id"], name: "index_solid_queue_processes_on_supervisor_id"
  end

  create_table "solid_queue_ready_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_ready_executions_on_job_id", unique: true
    t.index ["priority", "job_id"], name: "index_solid_queue_poll_all"
    t.index ["queue_name", "priority", "job_id"], name: "index_solid_queue_poll_by_queue"
  end

  create_table "solid_queue_scheduled_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "scheduled_at", null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_scheduled_executions_on_job_id", unique: true
    t.index ["scheduled_at", "priority", "job_id"], name: "index_solid_queue_dispatch_all"
  end

  create_table "solid_queue_semaphores", force: :cascade do |t|
    t.string "key", null: false
    t.integer "value", default: 1, null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expires_at"], name: "index_solid_queue_semaphores_on_expires_at"
    t.index ["key", "value"], name: "index_solid_queue_semaphores_on_key_and_value"
    t.index ["key"], name: "index_solid_queue_semaphores_on_key", unique: true
  end

  create_table "taxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zone_id", null: false
    t.string "kind", null: false
    t.string "installation_type", null: false
    t.datetime "start_at", null: false
    t.string "name", null: false
    t.decimal "percentage", precision: 12, scale: 10, null: false
    t.index ["zone_id"], name: "index_taxes_on_zone_id"
  end

  create_table "zones_energy_periods", id: false, force: :cascade do |t|
    t.integer "zone_id", null: false
    t.integer "energy_period_id", null: false
    t.index ["energy_period_id", "zone_id"], name: "index_zones_energy_periods_on_energy_period_id_and_zone_id", unique: true
    t.index ["energy_period_id"], name: "index_zones_energy_periods_on_energy_period_id"
    t.index ["zone_id"], name: "index_zones_energy_periods_on_zone_id"
  end

  add_foreign_key "costs", "countries"
  add_foreign_key "daily_energy_export_prices", "zones"
  add_foreign_key "daily_energy_import_prices", "zones"
  add_foreign_key "energy_prices", "zones"
  add_foreign_key "rates", "inverters"
  add_foreign_key "solid_queue_blocked_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_claimed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_failed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_ready_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_scheduled_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "taxes", "zones"
  add_foreign_key "zones_energy_periods", "energy_periods"
  add_foreign_key "zones_energy_periods", "zones"
end
