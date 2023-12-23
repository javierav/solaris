module Solaris
  module Inverters
    class Huawei
      class SolarEnergyRegister < Solaris::Modbus::Register
        def self.address
          32_114
        end

        def self.quantity
          2
        end

        def self.scale
          100
        end

        def self.deserialize(binary_string)
          BinData::Uint32be.read(binary_string)
        end
      end
    end
  end
end
