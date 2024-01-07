class CreateEnergyPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :energy_prices, id: false do |t|
      t.string :type, null: false
      t.references :zone, null: false, foreign_key: true
      t.datetime :datetime, null: false
      t.decimal :import, precision: 8, scale: 6, null: false
      t.decimal :export, precision: 8, scale: 6, null: false
      t.index %i[type zone_id datetime], unique: true
    end
  end
end
