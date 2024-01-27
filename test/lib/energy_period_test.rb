require "test_helper"

class EnergyPeriodTest < ActiveSupport::TestCase
  test "weekday pen, can, bal" do
    off_peak_hours = (0..7)
    standard_hours = [(8..9), (14..17)].map(&:to_a).flatten
    peak_hours = [(10..13), (18..21)].map(&:to_a).flatten

    (1..3).each do |region|
      Region.stub(:current, Region.new(region.to_s)) do
        off_peak_hours.each do |hour|
          assert_equal :off_peak, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
        standard_hours.each do |hour|
          assert_equal :standard, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
        peak_hours.each do |hour|
          assert_equal :peak, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
      end
    end
  end

  test "weekday mel, ceu" do
    off_peak_hours = (0..7)
    standard_hours = [(8..10), (15..18), (23..23)].map(&:to_a).flatten
    peak_hours = [(11..14), (19..22)].map(&:to_a).flatten

    (4..5).each do |region|
      Region.stub(:current, Region.new(region.to_s)) do
        off_peak_hours.each do |hour|
          assert_equal :off_peak, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
        standard_hours.each do |hour|
          assert_equal :standard, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
        peak_hours.each do |hour|
          assert_equal :peak, EnergyPeriod.for(Time.zone.parse("2024-01-03 #{hour}:00"))
        end
      end
    end
  end

  test "weekend" do
    (0..23).each do |hour|
      (1..5).each do |region|
        Region.stub(:current, Region.new(region.to_s)) do
          assert_equal :off_peak, EnergyPeriod.for(Time.zone.parse("2024-01-07 #{hour}:00"))
        end
      end
    end
  end

  test "holiday" do
    (0..23).each do |hour|
      (1..5).each do |region|
        Region.stub(:current, Region.new(region.to_s)) do
          assert_equal :off_peak, EnergyPeriod.for(Time.zone.parse("2024-01-01 #{hour}:00"))
        end
      end
    end
  end
end
