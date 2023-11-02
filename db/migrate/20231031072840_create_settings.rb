class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.timestamps null: false
      t.string :timezone, default: "Europe/Madrid"
      t.integer :loop_interval, default: 30
      t.integer :archive_interval, default: 60
      t.string :energy_price
      t.string :energy_price_at
      t.string :energy_price_for
      t.string :esios_api_key
      t.integer :esios_zone
      t.integer :esios_country
      t.string :inverter
      t.string :huawei_ip
      t.integer :huawei_port
    end
  end
end
