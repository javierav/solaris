class CreateArchive < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :archive, id: :datetime, primary_key: :created_at do |t|
      t.float :solar_power, null: false
      t.float :solar_energy, null: false
      t.float :temperature, null: false
      t.float :grid_power, null: false
      t.float :grid_export, null: false
      t.float :grid_import, null: false
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
