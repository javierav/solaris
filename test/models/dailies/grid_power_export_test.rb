require "test_helper"

module Dailies
  class GridPowerExportTest < ActiveSupport::TestCase
    test "create daily grid power export without max" do
      model = GridPowerExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily grid power export without maxtime" do
      model = GridPowerExport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxtime, :blank)
      end
    end

    test "create daily grid power export" do
      populate_archives

      model = GridPowerExport.new(date: Date.parse("2024-01-01"))

      assert_in_delta 800, model.compute_max
      assert_in_delta Time.zone.parse("2024-01-01 15:15:00"), model.compute_maxtime
    end

    private

    def create_archive(attributes = {})
      Archive.create(
        attributes.reverse_merge(solar_power: 0, solar_energy: 0, grid_energy_export: 0, grid_energy_import: 0)
      )
    end

    def populate_archives
      create_archive(datetime: Time.zone.parse("2024-01-01 09:09:00"), grid_power: -1500)
      create_archive(datetime: Time.zone.parse("2024-01-01 11:11:00"), grid_power: 500)
      create_archive(datetime: Time.zone.parse("2024-01-01 15:15:00"), grid_power: 800)
    end
  end
end
