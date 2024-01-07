require "test_helper"

class AvailableRateTest < ActiveSupport::TestCase
  test "create without country" do
    available_rate = AvailableRate.new

    assert_not available_rate.save
    assert available_rate.errors.added?(:country, :blank)
  end

  test "create without rate" do
    available_rate = AvailableRate.new

    assert_not available_rate.save
    assert available_rate.errors.added?(:rate, :blank)
  end

  test "create with duplicate rate" do
    available_rate = AvailableRate.new(country: countries(:es), rate: "pvpc")

    assert_not available_rate.save
    assert available_rate.errors.added?(:rate, :taken, value: "pvpc")
  end

  test "create with valid attributes" do
    available_rate = AvailableRate.new(country: countries(:es), rate: "test")

    assert available_rate.save
  end
end
