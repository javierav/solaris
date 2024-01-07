class CreateZonesEnergyPeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :zones_energy_periods, id: false do |t|
      t.references :zone, null: false, foreign_key: true
      t.references :energy_period, null: false, foreign_key: true
      t.index %i[energy_period_id zone_id], unique: true
    end
  end
end
