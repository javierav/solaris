require "test_helper"

class ProtocolTest < ActiveSupport::TestCase
  test "save protocol without name" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:name, :blank)
  end

  test "save protocol without gateways" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:gateways, :blank)
  end

  test "save protocol without solar_power" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:solar_power, :blank)
  end

  test "save protocol without solar_energy" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:solar_energy, :blank)
  end

  test "save protocol without grid_power" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:grid_power, :blank)
  end

  test "save protocol without grid_energy_export" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:grid_energy_export, :blank)
  end

  test "save protocol without grid_energy_import" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:grid_energy_import, :blank)
  end

  test "save protocol without model" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:model, :blank)
  end

  test "save protocol without serial_number" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:serial_number, :blank)
  end

  test "save protocol without firmware_version" do
    protocol = Protocol.new

    assert_not protocol.save
    assert protocol.errors.added?(:firmware_version, :blank)
  end

  test "save protocol with duplicated name" do
    protocol = Protocol.new(name: protocols(:huawei_modbus).name)

    assert_not protocol.save
    assert protocol.errors.added?(:name, :taken, value: protocols(:huawei_modbus).name)
  end

  test "save protocol with all attributes" do
    protocol = Protocol.new(
      name: "test protocol",
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

    assert protocol.save
  end
end
