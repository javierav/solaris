require "test_helper"

class ZoneTest < ActiveSupport::TestCase
  test "create without name" do
    zone = Zone.new

    assert_not zone.save
    assert zone.errors.added?(:name, :blank)
  end

  test "create without country" do
    zone = Zone.new

    assert_not zone.save
    assert zone.errors.added?(:country, :blank)
  end

  test "create without timezone" do
    zone = Zone.new

    assert_not zone.save
    assert zone.errors.added?(:timezone, :blank)
  end

  test "create with duplicate name" do
    zone = Zone.new(name: "Canarias", country: countries(:es))

    assert_not zone.save
    assert zone.errors.added?(:name, :taken, value: "Canarias")
  end

  test "create with valid attributes" do
    zone = Zone.new(name: "Gibraltar", country: countries(:es), timezone: "Europe/Madrid")

    assert zone.save
  end

  test "default configuration" do
    assert_empty(Zone.new.configuration)
  end
end
