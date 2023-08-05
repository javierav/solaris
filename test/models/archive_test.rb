require "test_helper"

class ArchiveTest < ActiveSupport::TestCase
  setup do
    data = {
      solar_power: 165.0,
      solar_energy: 15.51,
      temperature: 38.0,
      grid_power: 0.0,
      grid_export: 2073.25,
      grid_import: 1246.7
    }

    @inverter = OpenStruct.new(data: OpenStruct.new(data))
  end

  test "should create archive from inverter" do
    Inverter.stub(:new, @inverter) do
      assert_difference("Archive.count") do
        Archive.create_from_inverter
      end
    end
  end

  test "should create archive with correct values" do
    Inverter.stub(:new, @inverter) do
      Archive.create_from_inverter
    end

    archive = Archive.last

    assert_in_delta Time.current, archive.created_at, 1.second
    assert_in_delta(165.0, archive.solar_power)
    assert_in_delta(15.51, archive.solar_energy)
    assert_in_delta(38.0, archive.temperature)
    assert_in_delta(0.0, archive.grid_power)
    assert_in_delta(2073.25, archive.grid_export)
    assert_in_delta(1246.7, archive.grid_import)
  end
end
