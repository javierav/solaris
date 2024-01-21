class CreateDailySolarPower < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_solar_power, id: :date, primary_key: :date do |t|
      t.integer :max, null: false
      t.datetime :maxtime, null: false
    end
  end
end
