class CreateCosts < ActiveRecord::Migration[7.1]
  def change
    create_table :costs do |t|
      t.timestamps null: false
      t.references :country, null: false, foreign_key: true
      t.datetime :start_at, null: false
      t.decimal :transport_toll_p1, precision: 8, scale: 6, null: false
      t.decimal :distribution_toll_p1, precision: 8, scale: 6, null: false
      t.decimal :charges_p1, precision: 8, scale: 6, null: false
      t.decimal :transport_toll_p2, precision: 8, scale: 6, null: false
      t.decimal :distribution_toll_p2, precision: 8, scale: 6, null: false
      t.decimal :charges_p2, precision: 8, scale: 6, null: false
      t.decimal :transport_toll_p3, precision: 8, scale: 6, null: false
      t.decimal :distribution_toll_p3, precision: 8, scale: 6, null: false
      t.decimal :charges_p3, precision: 8, scale: 6, null: false
    end
  end
end
