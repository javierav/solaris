require "test_helper"

module Dailies
  class SolarPowerTest < ActiveSupport::TestCase
    test "create daily solar power without max" do
      model = SolarPower.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily solar power without maxtime" do
      model = SolarPower.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxtime, :blank)
      end
    end

    test "create daily solar power" do
      populate_archives

      model = SolarPower.new(date: Date.parse("2024-01-01"))

      assert_in_delta 2078, model.compute_max
      assert_in_delta Time.zone.parse("2024-01-01 14:14:00"), model.compute_maxtime
    end

    private

    def create_archive(attributes = {})
      Archive.create(
        attributes.reverse_merge(solar_energy: 0, grid_power: 0, grid_energy_export: 0, grid_energy_import: 0)
      )
    end

    def populate_archives
      create_archive(datetime: Time.zone.parse("2023-12-31 10:10:00"), solar_power: 2100)
      create_archive(datetime: Time.zone.parse("2024-01-01 12:12:00"), solar_power: 1546)
      create_archive(datetime: Time.zone.parse("2024-01-01 14:14:00"), solar_power: 2078)
      create_archive(datetime: Time.zone.parse("2024-01-01 18:18:00"), solar_power: 897)
      create_archive(datetime: Time.zone.parse("2024-01-02 15:15:00"), solar_power: 2526)
    end
  end
end
