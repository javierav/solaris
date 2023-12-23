module Solaris
  module Inverters
    class Huawei
      class GridEnergyImportRegister < Solaris::Modbus::Register
        def self.address
          37_121
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
