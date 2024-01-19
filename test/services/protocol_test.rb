require "test_helper"

class ProtocolTest < ActiveSupport::TestCase
  test ".current returns the current protocol" do
    Rails.configuration.x.stub :protocol, "huawei_modbus" do
      assert_equal HuaweiModbusProtocol, Protocol.current
    end
  end
end
