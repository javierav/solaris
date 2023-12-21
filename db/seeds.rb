# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# create default settings
Setting.instance

# huawei modbus protocol
Protocol
  .create_with(
    gateways: %w[modbus_mqtt],
    solar_power: { address: 32_080, quantity: 2, type: :int32be, scale: 1 },
    solar_energy: { address: 32_114, quantity: 2, type: :uint32be, scale: 100 },
    grid_power: { address: 37_113, quantity: 2, type: :int32be, scale: 1 },
    grid_energy_export: { address: 37_119, quantity: 2, type: :int32be, scale: 100 },
    grid_energy_import: { address: 37_121, quantity: 2, type: :int32be, scale: 100 },
    model: { address: 30_000, quantity: 15, type: :string },
    serial_number: { address: 30_015, quantity: 10, type: :string },
    firmware_version: { address: 30_025, quantity: 10, type: :string }
  )
  .find_or_create_by(name: "Huawei Modbus")
