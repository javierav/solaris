class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays, id: false do |t|
      t.timestamps null: false
      t.date :date, null: false, index: { unique: true }
      t.string :name, null: false
    end
  end
end
