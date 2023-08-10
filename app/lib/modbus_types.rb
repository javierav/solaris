module ModbusTypes
  def self.i16(value)
    value
  end

  def self.i32(value)
    value.to_32i.first
  end

  def self.string(value)
    value.map(&:to_word).join.strip
  end

  def self.u16(value)
    value
  end

  def self.u32(value)
    value.to_32u.first
  end
end
