require "test_helper"

class HuaweiModbusProtocolTest < ActiveSupport::TestCase
  setup do
    @protocol = HuaweiModbusProtocol.new
  end

  test "solar power" do
    assert_equal 32_080, @protocol.solar_power.address
    assert_equal 2, @protocol.solar_power.quantity
    assert_equal "int32be", @protocol.solar_power.type
    assert_equal 1, @protocol.solar_power.scale
  end

  test "solar energy" do
    assert_equal 32_114, @protocol.solar_energy.address
    assert_equal 2, @protocol.solar_energy.quantity
    assert_equal "uint32be", @protocol.solar_energy.type
    assert_equal 100, @protocol.solar_energy.scale
  end

  test "grid power" do
    assert_equal 37_113, @protocol.grid_power.address
    assert_equal 2, @protocol.grid_power.quantity
    assert_equal "int32be", @protocol.grid_power.type
    assert_equal 1, @protocol.grid_power.scale
  end

  test "grid energy export" do
    assert_equal 37_119, @protocol.grid_energy_export.address
    assert_equal 2, @protocol.grid_energy_export.quantity
    assert_equal "int32be", @protocol.grid_energy_export.type
    assert_equal 100, @protocol.grid_energy_export.scale
  end

  test "grid energy import" do
    assert_equal 37_121, @protocol.grid_energy_import.address
    assert_equal 2, @protocol.grid_energy_import.quantity
    assert_equal "int32be", @protocol.grid_energy_import.type
    assert_equal 100, @protocol.grid_energy_import.scale
  end

  test "model" do
    assert_equal 30_000, @protocol.model.address
    assert_equal 15, @protocol.model.quantity
    assert_equal "string", @protocol.model.type
  end

  test "serial number" do
    assert_equal 30_015, @protocol.serial_number.address
    assert_equal 10, @protocol.serial_number.quantity
    assert_equal "string", @protocol.serial_number.type
  end
end
