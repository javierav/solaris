require "test_helper"

module Dailies
  class SolarEnergyTest < ActiveSupport::TestCase
    test "create daily solar energy without max" do
      model = SolarEnergy.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily solar energy without maxhour" do
      model = SolarEnergy.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxhour, :blank)
      end
    end

    test "create daily solar energy without sum" do
      model = SolarEnergy.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:sum, :blank)
      end
    end

    test "create daily solar energy" do
      populate_archives

      model = SolarEnergy.new(date: Date.parse("2024-01-01"))

      assert_in_delta 2, model.compute_max
      assert_in_delta 12, model.compute_maxhour
      assert_in_delta 4.5, model.compute_sum
    end

    private

    def create_archive(attributes = {})
      Archive.create(
        attributes.reverse_merge(solar_power: 0, grid_power: 0, grid_energy_export: 0, grid_energy_import: 0)
      )
    end

    def populate_archives
      create_archive(datetime: Time.zone.parse("2024-01-01 12:12:00"), solar_energy: 1)
      create_archive(datetime: Time.zone.parse("2024-01-01 12:24:00"), solar_energy: 3)
      create_archive(datetime: Time.zone.parse("2024-01-01 16:16:00"), solar_energy: 4)
      create_archive(datetime: Time.zone.parse("2024-01-01 16:32:00"), solar_energy: 4.5)
      create_archive(datetime: Time.zone.parse("2024-01-02 16:20:00"), solar_energy: 6)
    end
  end
end
