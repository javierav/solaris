module Solaris
  module Inverters
    class Huawei < ModbusInverter
      def self.available?
        ENV.fetch("SOLARIS_HUAWEI_IP").present?
      end

      def inverter_ip
        ENV.fetch("SOLARIS_HUAWEI_IP")
      end

      def inverter_port
        ENV.fetch("SOLARIS_HUAWEI_PORT", 502).to_i
      end

      def inverter_slave_id
        1
      end

      def inverter_offset
        Time.now.in_time_zone.utc_offset
      end

      def solar_power_registry
        { type: :i32, address: 32_080, quantity: 2, scale: 1 }
      end

      def solar_energy_registry
        { type: :u32, address: 32_114, quantity: 2, scale: 100 }
      end

      def temperature_registry
        { type: :i16, address: 32_087, quantity: 1, scale: 10 }
      end

      def grid_power_registry
        { type: :i32, address: 37_113, quantity: 2, scale: 1 }
      end

      def grid_energy_export_registry
        { type: :i32, address: 37_119, quantity: 2, scale: 100 }
      end

      def grid_energy_import_registry
        { type: :i32, address: 37_121, quantity: 2, scale: 100 }
      end

      def created_at_registry
        { type: :u32, address: 40_000, quantity: 2, scale: 1 }
      end

      def convert_created_at(value)
        Time.zone.at(value.to_i - inverter_offset)
      end
    end
  end
end
