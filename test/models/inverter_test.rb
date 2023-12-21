require "test_helper"

class InverterTest < ActiveSupport::TestCase
  test "save inverter without name" do
    inverter = Inverter.new

    assert_not inverter.save
    assert inverter.errors.added?(:name, :blank)
  end

  test "save inverter without protocol" do
    inverter = Inverter.new

    assert_not inverter.save
    assert inverter.errors.added?(:protocol, :blank)
  end

  test "save inverter without timezone" do
    inverter = Inverter.new

    assert_not inverter.save
    assert inverter.errors.added?(:timezone, :blank)
  end

  test "save inverter with name, protocol and timezone" do
    inverter = Inverter.new(name: "Inverter 1", protocol: protocols(:huawei_modbus), timezone: "Europe/Madrid")

    assert inverter.save
  end

  test "sqid" do
    inverter = inverters(:house)

    assert_equal inverter, Inverter.from_sqid(inverter.to_param)
    assert_kind_of String, inverter.to_param
    assert_equal 10, inverter.to_param.length
  end
end
