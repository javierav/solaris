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

ActiveRecord::Schema[7.1].define(version: 2024_01_06_160413) do
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

  create_table "countries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", null: false
    t.string "name", null: false
    t.string "p1_name", null: false
    t.string "p2_name", null: false
    t.string "p3_name", null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
  end

  create_table "energy_price", primary_key: "datetime", id: :datetime, force: :cascade do |t|
    t.float "import"
    t.float "export"
  end

  create_table "inverters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "protocol_id", null: false
    t.string "timezone", null: false
    t.integer "loop_interval", default: 60, null: false
    t.integer "archive_interval", default: 300, null: false
    t.string "brand"
    t.string "model"
    t.string "serial_number"
    t.string "firmware_version"
    t.index ["protocol_id"], name: "index_inverters_on_protocol_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.json "gateways", default: [], null: false
    t.json "solar_power", default: {}, null: false
    t.json "solar_energy", default: {}, null: false
    t.json "grid_power", default: {}, null: false
    t.json "grid_energy_export", default: {}, null: false
    t.json "grid_energy_import", default: {}, null: false
    t.json "model", default: {}, null: false
    t.json "serial_number", default: {}, null: false
    t.json "firmware_version", default: {}, null: false
    t.index ["name"], name: "index_protocols_on_name", unique: true
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

  add_foreign_key "inverters", "protocols"
  add_foreign_key "solid_queue_blocked_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_claimed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_failed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_ready_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_scheduled_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
end
