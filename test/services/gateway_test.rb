require "test_helper"

class GatewayTest < ActiveSupport::TestCase
  test ".current returns the current gateway" do
    Rails.configuration.x.stub :gateway, "modbus_mqtt" do
      assert_equal ModbusMQTTGateway, Gateway.current
    end
  end
end
