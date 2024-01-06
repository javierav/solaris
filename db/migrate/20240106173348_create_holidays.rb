class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays do |t|
      t.timestamps null: false
      t.references :country, null: false, foreign_key: true
      t.string :name, null: false
      t.date :date, null: false
      t.index %i[country_id date], unique: true
    end
  end
end
