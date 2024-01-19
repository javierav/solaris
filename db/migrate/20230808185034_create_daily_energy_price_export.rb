class CreateDailyEnergyPriceExport < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_energy_price_export, id: :date, primary_key: :date do |t|
      t.decimal :max, precision: 8, scale: 6, null: false
      t.datetime :maxtime, null: false
      t.decimal :min, precision: 8, scale: 6, null: false
      t.datetime :mintime, null: false
      t.decimal :avg, precision: 8, scale: 6, null: false
    end
  end
end
