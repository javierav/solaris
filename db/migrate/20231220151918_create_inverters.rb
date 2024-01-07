class CreateInverters < ActiveRecord::Migration[7.1]
  def change
    create_table :inverters do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.string :installation_type, null: false
      t.integer :installation_power
      t.integer :installation_panels
      t.integer :installation_price
      t.date :installation_date
      t.references :zone, null: false, foreign_key: true
      t.string :latitude
      t.string :longitude
      t.references :protocol, null: false, foreign_key: true
      t.string :brand
      t.string :model
      t.string :serial_number
      t.string :firmware_version
      t.datetime :viewed_at
    end
  end
end
