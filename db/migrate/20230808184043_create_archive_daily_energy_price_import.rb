class CreateArchiveDailyEnergyPriceImport < ActiveRecord::Migration[7.1]
  def change
    create_table :archive_daily_energy_price_import, id: :date, primary_key: :date do |t|
      t.float :max, null: false
      t.datetime :maxtime, null: false
      t.float :min, null: false
      t.datetime :mintime, null: false
      t.float :avg, null: false
    end
  end
end
