class CreateArchiveDailyGridEnergyImport < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :archive_daily_grid_energy_import, id: :date, primary_key: :date do |t|
      t.float :max, null: false
      t.datetime :maxtime, null: false
      t.float :sum, null: false
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
