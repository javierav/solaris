require "test_helper"

module Loops
  class ArchiveTest < ActiveSupport::TestCase
    test "create archive with stored data" do
      store = MetricStore.new

      store.set(solar_power: 1, solar_energy: 4, grid_power: 7, grid_energy_import: 10, grid_energy_export: 13)
      store.set(solar_power: 2, solar_energy: 5, grid_power: 8, grid_energy_import: 11, grid_energy_export: 14)
      store.set(solar_power: 3, solar_energy: 6, grid_power: 9, grid_energy_import: 12, grid_energy_export: 15)

      assert_difference("::Archive.count", 1) do
        Loops::Archive.run(store)
      end

      archive = ::Archive.last

      assert_equal 2, archive.solar_power
      assert_in_delta(6.0, archive.solar_energy)
      assert_equal 8, archive.grid_power
      assert_in_delta(12.0, archive.grid_energy_import)
      assert_in_delta(15.0, archive.grid_energy_export)
    end
  end
end
