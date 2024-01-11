class CreateArchive < ActiveRecord::Migration[7.1]
  def change
    create_table :archive, id: :datetime, primary_key: :created_at do |t|
      t.float :solar_power, null: false
      t.float :solar_energy, null: false
      t.float :temperature, null: false
      t.float :grid_power, null: false
      t.float :grid_energy_export, null: false
      t.float :grid_energy_import, null: false
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
