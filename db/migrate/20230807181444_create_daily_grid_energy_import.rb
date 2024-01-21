class CreateDailyGridEnergyImport < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_grid_energy_import, id: :date, primary_key: :date do |t|
      t.decimal :max, precision: 8, scale: 2, null: false
      t.integer :maxhour, null: false
      t.decimal :min, precision: 8, scale: 2, null: false
      t.integer :minhour, null: false
      t.decimal :sum, precision: 8, scale: 2, null: false
    end
  end
end
