module Solaris
  module Inverters
    class ModbusInverter < Base
      def initialize
        super
        @data = {}
      end

      def read
        with_modbus_client do |client|
          @data = registers.to_h do |key, registry|
            [key, convert_value(key, read_register(client, registry))]
          end
        end
        @data
      end

      private

      def with_modbus_client(&)
        ModBus::TCPClient.new(inverter_ip, inverter_port) do |client|
          client.with_slave(inverter_slave_id, &)
        end
      rescue Errno::ECONNRESET
        nil
      end

      def registers_keys
        %i[solar_power solar_energy temperature grid_power grid_energy_export grid_energy_import created_at]
      end

      def registers
        @registers ||= registers_keys.index_with { |register| send("#{register}_registry") }
      end

      def read_register(client, registry)
        value = typify(registry[:type], client.read_holding_registers(registry[:address], registry[:quantity]))
        value = value.first if value.is_a?(Array) && value.size == 1
        value /= (registry[:scale] * 1.0) if registry[:scale]
        value
      end

      def typify(type, value)
        ModbusTypes.send(type, value)
      end

      def convert_value(name, value)
        respond_to?("convert_#{name}") ? send("convert_#{name}", value) : value
      end
    end
  end
end
