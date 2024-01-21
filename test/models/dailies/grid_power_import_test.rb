require "test_helper"

module Dailies
  class GridPowerImportTest < ActiveSupport::TestCase
    test "create daily grid power import without max" do
      model = GridPowerImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:max, :blank)
      end
    end

    test "create daily grid power import without maxtime" do
      model = GridPowerImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:maxtime, :blank)
      end
    end

    test "create daily grid power import without min" do
      model = GridPowerImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:min, :blank)
      end
    end

    test "create daily grid power import without mintime" do
      model = GridPowerImport.new(date: Date.parse("2024-01-01"))

      model.stub(:compute, true) do
        assert_not model.save
        assert model.errors.added?(:mintime, :blank)
      end
    end

    test "create daily grid power import" do
      populate_archives

      model = GridPowerImport.new(date: Date.parse("2024-01-01"))

      assert_in_delta 2500, model.compute_max
      assert_in_delta Time.zone.parse("2024-01-01 19:09:00"), model.compute_maxtime
      assert_in_delta 1500, model.compute_min
      assert_in_delta Time.zone.parse("2024-01-01 09:09:00"), model.compute_mintime
    end

    private

    def create_archive(attributes = {})
      Archive.create(
        attributes.reverse_merge(solar_power: 0, solar_energy: 0, grid_energy_export: 0, grid_energy_import: 0)
      )
    end

    def populate_archives
      create_archive(datetime: Time.zone.parse("2024-01-01 09:09:00"), grid_power: -1500)
      create_archive(datetime: Time.zone.parse("2024-01-01 10:09:00"), grid_power: 300)
      create_archive(datetime: Time.zone.parse("2024-01-01 16:09:00"), grid_power: 3000)
      create_archive(datetime: Time.zone.parse("2024-01-01 19:09:00"), grid_power: -2500)
    end
  end
end
