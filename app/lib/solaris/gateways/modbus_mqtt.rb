module Solaris
  module Gateways
    class ModbusMQTT < Base
      def initialize
        @client = initialize_client
        @transaction = initialize_transaction
      end

      def read(register)
        transaction = next_transaction

        promise = Concurrent::Promise.execute do
          @client.subscribe(mqtt_subscribe_topic)

          request = Solaris::Modbus::ADU.read_register(
            transaction, modbus_slave_id, register.address, register.quantity
          ).to_binary_s

          @client.publish(mqtt_publish_topic, request)

          loop do
            _topic, message = @client.get
            adu = Solaris::Modbus::ADU.parse(message)

            break adu if adu.transaction == transaction
          end
        end

        promise.value(30) ? register.from_binary(promise.value.get.data) : nil
      end

      def close
        @client&.disconnect
      end

      private

      def mqtt_ip
        Setting.instance.gateway_modbus_mqtt_ip
      end

      def mqtt_port
        Setting.instance.gateway_modbus_mqtt_port
      end

      def mqtt_ssl
        Setting.instance.gateway_modbus_mqtt_ssl
      end

      def mqtt_account
        Setting.instance.gateway_modbus_mqtt_account
      end

      def mqtt_password
        Setting.instance.gateway_modbus_mqtt_password
      end

      def mqtt_subscribe_topic
        Setting.instance.gateway_modbus_mqtt_subscribe_topic
      end

      def mqtt_publish_topic
        Setting.instance.gateway_modbus_mqtt_publish_topic
      end

      def modbus_slave_id
        Setting.instance.gateway_modbus_mqtt_slave_id
      end

      def initialize_client
        MQTT::Client.connect(
          host: mqtt_ip,
          port: mqtt_port,
          ssl: mqtt_ssl,
          username: mqtt_account,
          password: mqtt_password
        )
      end

      def initialize_transaction
        Random.new.rand(65535)
      end

      def next_transaction
        id = @transaction
        @transaction += 1
        @transaction = 0 if @transaction > 65535 # 2 bytes 0xFFFF
        id
      end
    end
  end
end
