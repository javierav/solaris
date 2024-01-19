class ModbusMQTTGateway < ApplicationGateway
  def initialize(transaction_start: nil)
    @client = initialize_client
    @transaction = transaction_start || initialize_transaction
  end

  def read(register)
    execution = execute(register)
    execution.value(10) ? register.from_binary(execution.value.get.data) : nil
  end

  def close
    @client&.disconnect
  end

  private

  def execute(register, transaction = next_transaction)
    Concurrent::Promise.execute do
      @client.subscribe(mqtt_subscribe_topic)

      request = Modbus::ADU.create_request(transaction, modbus_slave_id, register).to_binary_s

      @client.publish(mqtt_publish_topic, request)

      loop do
        _topic, response = @client.get
        adu = Modbus::ADU.parse_response(response)

        break adu if adu.transaction == transaction
      end
    end
  end

  def mqtt_host
    Rails.configuration.x.gateways.modbus_mqtt.host
  end

  def mqtt_port
    Rails.configuration.x.gateways.modbus_mqtt.port.try(:to_i)
  end

  def mqtt_ssl
    Rails.configuration.x.gateways.modbus_mqtt.ssl.try(:to_boolean)
  end

  def mqtt_account
    Rails.configuration.x.gateways.modbus_mqtt.account
  end

  def mqtt_password
    Rails.configuration.x.gateways.modbus_mqtt.password
  end

  def mqtt_subscribe_topic
    Rails.configuration.x.gateways.modbus_mqtt.subscribe_topic
  end

  def mqtt_publish_topic
    Rails.configuration.x.gateways.modbus_mqtt.publish_topic
  end

  def modbus_slave_id
    Rails.configuration.x.gateways.modbus_mqtt.slave_id.try(:to_i)
  end

  def initialize_client
    MQTT::Client.connect(
      host: mqtt_host,
      port: mqtt_port,
      ssl: mqtt_ssl,
      username: mqtt_account,
      password: mqtt_password
    )
  end

  def initialize_transaction
    Random.new.rand(65_535)
  end

  def mutex
    @mutex ||= Mutex.new
  end

  def next_transaction
    mutex.synchronize do
      id = @transaction
      @transaction += 1
      @transaction = 0 if @transaction > 65_535 # 2 bytes 0xFFFF
      id
    end
  end
end
