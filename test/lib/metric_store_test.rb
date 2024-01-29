require "test_helper"

class MetricStoreTest < ActiveSupport::TestCase
  test "get empty" do
    store = MetricStore.new

    assert_equal(
      { solar_power: 0, solar_energy: 0.0, grid_power: 0, grid_energy_import: 0.0, grid_energy_export: 0.0 },
      store.get
    )
  end

  test "get with values" do
    store = MetricStore.new

    store.set(solar_power: 1, solar_energy: 4, grid_power: 7, grid_energy_import: 10, grid_energy_export: 13)
    store.set(solar_power: 2, solar_energy: 5, grid_power: 8, grid_energy_import: 11, grid_energy_export: 14)
    store.set(solar_power: 3, solar_energy: 6, grid_power: 9, grid_energy_import: 12, grid_energy_export: 15)

    assert_equal(
      { solar_power: 2, solar_energy: 6.0, grid_power: 8, grid_energy_import: 12.0, grid_energy_export: 15.0 },
      store.get
    )
  end

  test "reset after get" do
    store = MetricStore.new

    store.set(solar_power: 1, solar_energy: 4, grid_power: 7, grid_energy_import: 10, grid_energy_export: 13)
    store.set(solar_power: 2, solar_energy: 5, grid_power: 8, grid_energy_import: 11, grid_energy_export: 14)
    store.set(solar_power: 3, solar_energy: 6, grid_power: 9, grid_energy_import: 12, grid_energy_export: 15)

    store.get

    assert_equal(
      { solar_power: 0, solar_energy: 0.0, grid_power: 0, grid_energy_import: 0.0, grid_energy_export: 0.0 },
      store.get
    )
  end
end
