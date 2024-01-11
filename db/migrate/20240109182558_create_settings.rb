class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.timestamps null: false
      t.string :var, null: false
      t.text :value, null: true
      t.index :var, unique: true
    end
  end
end
