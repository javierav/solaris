class CreateDailySolarEnergy < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_solar_energy, id: :date, primary_key: :date do |t|
      t.decimal :max, precision: 4, scale: 2, null: false
      t.integer :maxhour, null: false
      t.decimal :sum, precision: 8, scale: 2, null: false
    end
  end
end
