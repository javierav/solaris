class CreateTaxes < ActiveRecord::Migration[7.1]
  def change
    create_table :taxes do |t|
      t.timestamps null: false
      t.references :zone, null: false, foreign_key: true
      t.string :kind, null: false
      t.string :installation_type, null: false
      t.datetime :start_at, null: false
      t.string :name, null: false
      t.decimal :percentage, precision: 12, scale: 10, null: false
    end
  end
end
