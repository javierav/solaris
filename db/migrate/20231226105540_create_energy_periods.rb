class CreateEnergyPeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :energy_periods do |t|
      t.timestamps null: false
      t.boolean :monday, null: false, default: false
      t.boolean :tuesday, null: false, default: false
      t.boolean :wednesday, null: false, default: false
      t.boolean :thursday, null: false, default: false
      t.boolean :friday, null: false, default: false
      t.boolean :saturday, null: false, default: false
      t.boolean :sunday, null: false, default: false
      t.boolean :holiday, null: false, default: false
      t.integer :start_hour, null: false
      t.integer :end_hour, null: false
      t.string :name, null: false
    end
  end
end
