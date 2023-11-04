require "test_helper"

class PeriodTest < ActiveSupport::TestCase
  test "period for now" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("now")

    assert_equal :now, period.type
    assert_predicate period, :now?
    assert_in_delta Time.zone.local(2023, 10, 25, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 10, 25, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_nil period.prev
    assert_equal "now", period.to_param
    assert_nil period.next
  end

  test "period for 2023-10-25" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("2023-10-25")

    assert_equal :day, period.type
    assert_predicate period, :day?
    assert_in_delta Time.zone.local(2023, 10, 25, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 10, 25, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_equal "2023-10-24", period.prev.to_param
    assert_equal "2023-10-25", period.to_param
    assert_equal "2023-10-26", period.next.to_param
  end

  test "period for 2023-W12" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("2023-W12")

    assert_equal :week, period.type
    assert_predicate period, :week?
    assert_in_delta Time.zone.local(2023, 03, 20, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 03, 26, 23, 59, 59), period.end, 1
    assert_equal "2023-03-26", period.current_day
    assert_equal "2023-W12", period.current_week
    assert_equal "2023-03", period.current_month
    assert_equal "2023", period.current_year
    assert_equal "2023-W11", period.prev.to_param
    assert_equal "2023-W12", period.to_param
    assert_equal "2023-W13", period.next.to_param
  end

  test "period for 2023-10" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("2023-10")

    assert_equal :month, period.type
    assert_predicate period, :month?
    assert_in_delta Time.zone.local(2023, 10, 1, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 10, 31, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_equal "2023-09", period.prev.to_param
    assert_equal "2023-10", period.to_param
    assert_equal "2023-11", period.next.to_param
  end

  test "period for 2023" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("2023")

    assert_equal :year, period.type
    assert_predicate period, :year?
    assert_in_delta Time.zone.local(2023, 1, 1, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 12, 31, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_equal "2022", period.prev.to_param
    assert_equal "2023", period.to_param
    assert_equal "2024", period.next.to_param
  end

  test "period for 2022-11-22:2023-11-22" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("2022-11-22:2023-11-22")

    assert_equal :custom, period.type
    assert_predicate period, :custom?
    assert_in_delta Time.zone.local(2022, 11, 22, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 11, 22, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_nil period.prev
    assert_equal "2022-11-22:2023-11-22", period.to_param
    assert_nil period.next
  end

  test "period for all" do
    travel_to Time.zone.local(2023, 10, 25, 12, 0)

    period = Period.parse("all")

    assert_equal :all, period.type
    assert_predicate period, :all?
    assert_in_delta Time.zone.local(2023, 3, 19, 0, 0), period.begin, 1
    assert_in_delta Time.zone.local(2023, 10, 25, 23, 59, 59), period.end, 1
    assert_equal "2023-10-25", period.current_day
    assert_equal "2023-W43", period.current_week
    assert_equal "2023-10", period.current_month
    assert_equal "2023", period.current_year
    assert_nil period.prev
    assert_equal "all", period.to_param
    assert_nil period.next
  end
end
