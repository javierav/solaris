class CreateArchiveDailyGridPowerImport < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :archive_daily_grid_power_import, id: :date, primary_key: :date do |t|
      t.float :max, null: false
      t.datetime :maxtime
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
