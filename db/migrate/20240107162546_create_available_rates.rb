class CreateAvailableRates < ActiveRecord::Migration[7.1]
  def change
    create_table :available_rates do |t|
      t.timestamps null: false
      t.references :country, null: false, foreign_key: true
      t.string :rate
      t.index %i[country_id rate], unique: true
    end
  end
end
