class CreateArchiveDailyGridPowerImport < ActiveRecord::Migration[7.1]
  def change
    create_table :archive_daily_grid_power_import, id: :date, primary_key: :date do |t|
      t.integer :max, null: false
      t.datetime :maxtime, null: false
    end
  end
end
