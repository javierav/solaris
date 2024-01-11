require "test_helper"

class HolidayTest < ActiveSupport::TestCase
  test "create without name" do
    holiday = Holiday.new

    assert_not holiday.save
    assert holiday.errors.added?(:name, :blank)
  end

  test "create without date" do
    holiday = Holiday.new

    assert_not holiday.save
    assert holiday.errors.added?(:date, :blank)
  end

  test "create with duplicate date" do
    holiday = Holiday.new(name: "Año Nuevo", date: Date.new(2024, 1, 1))

    assert_not holiday.save
    assert holiday.errors.added?(:date, :taken, value: Date.new(2024, 1, 1))
  end

  test "create with valid attributes" do
    holiday = Holiday.new(name: "Año Nuevo", date: Date.new(2025, 1, 1))

    assert holiday.save
  end
end
