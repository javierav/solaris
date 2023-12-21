class CreateProtocols < ActiveRecord::Migration[7.1]
  def change
    create_table :protocols do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.json :gateways, null: false, default: []
      t.json :solar_power, null: false, default: {}
      t.json :solar_energy, null: false, default: {}
      t.json :grid_power, null: false, default: {}
      t.json :grid_energy_export, null: false, default: {}
      t.json :grid_energy_import, null: false, default: {}
      t.json :model, null: false, default: {}
      t.json :serial_number, null: false, default: {}
      t.json :firmware_version, null: false, default: {}
      t.index :name, unique: true
    end
  end
end
