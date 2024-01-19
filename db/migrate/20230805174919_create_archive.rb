class CreateArchive < ActiveRecord::Migration[7.1]
  def change
    create_table :archive, id: { type: :datetime, precision: 0 }, primary_key: :datetime do |t|
      t.integer :solar_power, null: false
      t.decimal :solar_energy, precision: 4, scale: 2, null: false
      t.integer :grid_power, null: false
      t.decimal :grid_energy_export, precision: 8, scale: 2, null: false
      t.decimal :grid_energy_import, precision: 8, scale: 2, null: false
    end
  end
end
