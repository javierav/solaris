require "test_helper"

class ModbusMQTTGatewayTest < ActiveSupport::TestCase
  test "register read" do
    with_stubbed_config do
      with_stubbed_mqtt_client do
        gateway = ModbusMQTTGateway.new(transaction_start: 22)

        assert_in_delta(111.0, gateway.read(register))
      end
    end
  end

  def register
    @register ||= Modbus::Register.new(address: 32_080, quantity: 2, type: "int32be", scale: 1)
  end

  def with_stubbed_config(&)
    Rails.configuration.x.gateways.modbus_mqtt.with(
      host: "localhost", port: 1883, ssl: false,
      account: "test", password: "test",
      subscribe_topic: "test/up",
      publish_topic: "test/down",
      slave_id: 1, &
    )
  end

  def with_stubbed_mqtt_client(&)
    mock = Minitest::Mock.new
    mock.expect(:subscribe, nil, ["test/up"])
    mock.expect(:get, [nil, "\x00\x16\x00\x00\x00\x07\x01\x03\x04\x00\x00\x00\x6f"])
    mock.expect(:publish, nil, ["test/down", "\x00\x16\x00\x00\x00\x06\x01\x03\x7d\x50\x00\x02"])

    MQTT::Client.stub(:connect, mock, &)

    mock.verify
  end
end
