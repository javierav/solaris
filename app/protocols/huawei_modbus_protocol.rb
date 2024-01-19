class HuaweiModbusProtocol < ApplicationProtocol
  def name
    "Huawei Modbus"
  end

  def gateways
    %w[huawei_modbus]
  end

  def solar_power
    Modbus::Register.new(address: 32_080, quantity: 2, type: "int32be", scale: 1)
  end

  def solar_energy
    Modbus::Register.new(address: 32_114, quantity: 2, type: "uint32be", scale: 100)
  end

  def grid_power
    Modbus::Register.new(address: 37_113, quantity: 2, type: "int32be", scale: 1)
  end

  def grid_energy_export
    Modbus::Register.new(address: 37_119, quantity: 2, type: "int32be", scale: 100)
  end

  def grid_energy_import
    Modbus::Register.new(address: 37_121, quantity: 2, type: "int32be", scale: 100)
  end

  def model
    Modbus::Register.new(address: 30_000, quantity: 15, type: "string")
  end

  def serial_number
    Modbus::Register.new(address: 30_015, quantity: 10, type: "string")
  end
end
