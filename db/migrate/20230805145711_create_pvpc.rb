class CreatePVPC < ActiveRecord::Migration[7.1]
  def change
    create_table :pvpc, id: :datetime, primary_key: :datetime do |t|
      t.decimal :import, precision: 8, scale: 6, null: false
      t.decimal :export, precision: 8, scale: 6, null: false
      t.decimal :factor, precision: 4, scale: 2, null: false
    end
  end
end
