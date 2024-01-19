class CreateDailyGridEnergyImport < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_grid_energy_import, id: :date, primary_key: :date do |t|
      t.decimal :max, precision: 8, scale: 2, null: false
      t.datetime :maxtime, null: false
      t.decimal :sum, precision: 8, scale: 2, null: false
    end
  end
end
