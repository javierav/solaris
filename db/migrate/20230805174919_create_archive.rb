class CreateArchive < ActiveRecord::Migration[7.1]
  def change
    create_table :archive, id: { type: :datetime, precision: 0 }, primary_key: :datetime do |t|
      t.float :solar_power, null: false
      t.float :solar_energy, null: false
      t.float :grid_power, null: false
      t.float :grid_energy_export, null: false
      t.float :grid_energy_import, null: false
    end
  end
end
