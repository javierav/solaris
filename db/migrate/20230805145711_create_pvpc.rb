class CreatePVPC < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :pvpc, id: :datetime, primary_key: :datetime do |t|
      t.float :import
      t.float :export
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
