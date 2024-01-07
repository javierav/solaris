class CreateZones < ActiveRecord::Migration[7.1]
  def change
    create_table :zones do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.references :country, null: false, foreign_key: true
      t.string :timezone, null: false
      t.json :configuration, null: false, default: {}
      t.index %i[country_id name], unique: true
    end
  end
end
