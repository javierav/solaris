class CreateDailyEnergyExportPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_energy_export_prices, id: false do |t|
      t.string :type, null: false
      t.references :zone, null: false, foreign_key: true
      t.date :date, null: false
      t.decimal :max, precision: 8, scale: 6, null: false
      t.datetime :maxtime, null: false
      t.decimal :min, precision: 8, scale: 6, null: false
      t.datetime :mintime, null: false
      t.decimal :avg, precision: 8, scale: 6, null: false
      t.index %i[type zone_id date], unique: true
    end
  end
end
