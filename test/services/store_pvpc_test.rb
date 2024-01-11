require "test_helper"

class StorePVPCTest < ActiveSupport::TestCase
  test "store PVPC" do
    assert_difference("PVPC.count", 2) do
      stub_esios do
        StorePVPC.run(Date.parse("2022-11-22"))
      end
    end
  end

  test "store PVPC with existing data" do
    stub_esios do
      StorePVPC.run(Date.parse("2022-11-22"))

      assert_no_difference("PVPC.count") do
        StorePVPC.run(Date.parse("2022-11-22"))
      end
    end
  end

  test "check stored data" do
    stub_esios do
      StorePVPC.run(Date.parse("2022-11-22"))
    end

    pvpc = PVPC.find_by(datetime: Time.zone.parse("2022-11-22 00:00:00"))

    assert_in_delta(0.1, pvpc.import)
    assert_in_delta(0.05, pvpc.export)
  end

  def stub_esios(&)
    ESIOS::Import.stub(:for_date, import_response) do
      ESIOS::Export.stub(:for_date, export_response, &)
    end
  end

  def import_response
    {
      Time.zone.parse("2022-11-22 00:00:00") => 0.1,
      Time.zone.parse("2022-11-22 01:00:00") => 0.2
    }
  end

  def export_response
    {
      Time.zone.parse("2022-11-22 00:00:00") => 0.05,
      Time.zone.parse("2022-11-22 01:00:00") => 0.1
    }
  end
end
