require "test_helper"

class HolidayTest < ActiveSupport::TestCase
  test "2022-11-22 is not holiday" do
    assert_not Holiday.all.include?(Date.parse("2022-11-22"))
  end

  test "2023-01-06 is holiday" do
    assert_includes Holiday.all, Date.parse("2023-01-06")
  end

  test "2024-01-01 is holiday" do
    assert_includes Holiday.all, Date.parse("2024-01-01")
  end
end
