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

  test "save inverter without zone" do
    inverter = Inverter.new

    assert_not inverter.save
    assert inverter.errors.added?(:zone, :blank)
  end

  test "save inverter without installation_type" do
    inverter = Inverter.new

    assert_not inverter.save
    assert inverter.errors.added?(:installation_type, :blank)
  end

  test "save inverter with name, installation_type, protocol and zone" do
    inverter = Inverter.new(
      name: "Inverter 1", installation_type: "domestic", protocol: protocols(:huawei_modbus), zone: zones(:peninsula)
    )

    assert inverter.save
  end

  test "sqid" do
    inverter = inverters(:house1)

    assert_equal inverter, Inverter.from_sqid(inverter.to_param)
    assert_kind_of String, inverter.to_param
    assert_equal 10, inverter.to_param.length
  end
end
