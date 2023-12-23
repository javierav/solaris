module Solaris
  module Inverters
    class Huawei
      class GridEnergyExportRegister < Solaris::Modbus::Register
        def self.address
          37_119
        end

        def self.quantity
          2
        end

        def self.scale
          100
        end

        def self.deserialize(binary_string)
          BinData::Int32be.read(binary_string)
        end
      end
    end
  end
end
