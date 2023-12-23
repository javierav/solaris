module Solaris
  module Inverters
    class Huawei
      class SolarPowerRegister < Solaris::Modbus::Register
        def self.address
          32_080
        end

        def self.quantity
          2
        end

        def self.scale
          1
        end

        def self.deserialize(binary_string)
          BinData::Int32be.read(binary_string)
        end
      end
    end
  end
end
