module Modbus
  READ_CODES = [0x01, 0x02, 0x03, 0x04].freeze
  WRITE_CODES = [0x05, 0x06].freeze
  EXCEPTIONS = {
    0x01 => "illegal function",
    0x02 => "illegal data address",
    0x03 => "illegal data value",
    0x04 => "slave device failure",
    0x05 => "acknowledge", # processing will take some time, no need to retry
    0x06 => "slave device busy",
    0x07 => "negative acknowledge",
    0x08 => "memory parity error",
    0x0A => "gateway path unavailable",
    0x0B => "gateway target device failed to respond"
  }.freeze
end
