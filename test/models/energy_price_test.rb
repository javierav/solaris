require "test_helper"

class EnergyPriceTest < ActiveSupport::TestCase
  test "create energy price without import" do
    energy_price = EnergyPrice.new

    assert_not energy_price.save
    assert energy_price.errors.added?(:import, :blank)
  end

  test "create energy price without export" do
    energy_price = EnergyPrice.new

    assert_not energy_price.save
    assert energy_price.errors.added?(:export, :blank)
  end

  test "create energy price with valid attributes" do
    energy_price = EnergyPrice.new(datetime: Time.current, import: 0.1, export: 0.05)

    assert energy_price.save
    assert_equal 2, energy_price.factor
  end
end
