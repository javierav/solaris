module Solaris
  module Inverters
    # TODO, ver si esto se puede unificar en Solaris::Inverter
    class Base
      def self.gateways
        raise NotImplementedError
      end

      def self.read
        instance = new
        instance.read
      rescue Exception
        nil
      ensure
        instance&.close
      end

      def initialize
        @gateway = Setting.instance.gateway_class.new
      end

      def read
        {
          solar_power: read_solar_power,
          solar_energy: read_solar_energy,
          grid_power: read_grid_power,
          grid_energy_export: read_grid_energy_export,
          grid_energy_import: read_grid_energy_import
        }
      end

      def close
        @gateway&.close
      end

      private

      def read_solar_power
        raise NotImplementedError
      end

      def read_solar_energy
        raise NotImplementedError
      end

      def read_grid_power
        raise NotImplementedError
      end

      def read_grid_energy_export
        raise NotImplementedError
      end

      def read_grid_energy_import
        raise NotImplementedError
      end
    end
  end
end
