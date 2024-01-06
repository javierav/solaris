class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.timestamps null: false
      t.string :code, null: false
      t.string :name, null: false
      t.string :p1_name, null: false
      t.string :p2_name, null: false
      t.string :p3_name, null: false
      t.index :code, unique: true
    end
  end
end
