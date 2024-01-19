class CreateRates < ActiveRecord::Migration[7.1]
  def change
    create_table :rates do |t|
      t.timestamps null: false
      t.references :inverter, null: false, foreign_key: true
      t.string :type, null: false
      t.datetime :start_at, null: false
      t.decimal :p1, precision: 8, scale: 6
      t.decimal :p2, precision: 8, scale: 6
      t.decimal :p3, precision: 8, scale: 6
      t.index %i[inverter_id start_at], unique: true
    end
  end
end
