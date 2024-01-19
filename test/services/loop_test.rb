require "test_helper"

class LoopTest < ActiveSupport::TestCase
  setup do
    Archive.delete_all
    travel_to Time.zone.parse("2024-01-01 00:00:00")
  end

  test "create archive if not exists any archive" do
    Inverter.stub(:read, inverter_response) do
      Rails.configuration.x.intervals.with(archive: 5) do
        assert_difference("Archive.count", 1) do
          Loop.run
        end
      end
    end
  end

  test "create archive if last archive is older than archive interval" do
    Archive.create(inverter_response.merge(datetime: 10.seconds.ago))

    Inverter.stub(:read, inverter_response) do
      Rails.configuration.x.intervals.with(archive: 5) do
        assert_difference("Archive.count", 1) do
          Loop.run
        end
      end
    end
  end

  test "not create archive if last archive is newer than archive interval" do
    Archive.create(inverter_response.merge(datetime: 4.seconds.ago))

    Inverter.stub(:read, inverter_response) do
      Rails.configuration.x.intervals.with(archive: 5) do
        assert_no_difference("Archive.count") do
          Loop.run
        end
      end
    end
  end

  def inverter_response
    {
      solar_power: 1,
      solar_energy: 2,
      grid_power: 3,
      grid_energy_export: 4,
      grid_energy_import: 5
    }
  end
end
