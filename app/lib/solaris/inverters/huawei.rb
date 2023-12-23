module Solaris
  module Inverters
    class Huawei < Base
      def self.gateways
        %w[modbus_mqtt]
      end

      private

      def read_solar_power
        @gateway.read(SolarPowerRegister)
      end

      def read_solar_energy
        @gateway.read(SolarEnergyRegister)
      end

      def read_grid_power
        @gateway.read(GridPowerRegister)
      end

      def read_grid_energy_export
        @gateway.read(GridEnergyExportRegister)
      end

      def read_grid_energy_import
        @gateway.read(GridEnergyImportRegister)
      end
    end
  end
end
