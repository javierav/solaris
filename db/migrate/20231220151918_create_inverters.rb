class CreateInverters < ActiveRecord::Migration[7.1]
  def change
    create_table :inverters do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.references :protocol, null: false, foreign_key: true
      t.string :timezone, null: false
      t.integer :loop_interval, null: false, default: 60
      t.integer :archive_interval, null: false, default: 300
      t.string :brand
      t.string :model
      t.string :serial_number
      t.string :firmware_version
    end
  end
end
