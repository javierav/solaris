class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.timestamps null: false
      t.string :timezone, default: "Europe/Madrid"
      t.integer :loop_interval, default: 30
      t.integer :archive_interval, default: 60
      t.string :energy_price
      t.string :energy_price_esios_api_key
      t.string :energy_price_esios_zone
      t.string :energy_price_esios_country
      t.string :inverter
      t.string :gateway
      t.string :gateway_modbus_mqtt_ip
      t.integer :gateway_modbus_mqtt_port
      t.boolean :gateway_modbus_mqtt_ssl, default: false
      t.integer :gateway_modbus_mqtt_slave_id
      t.string :gateway_modbus_mqtt_client_id
      t.string :gateway_modbus_mqtt_account
      t.string :gateway_modbus_mqtt_password
      t.string :gateway_modbus_mqtt_subscribe_topic
      t.string :gateway_modbus_mqtt_publish_topic
    end
  end
end
