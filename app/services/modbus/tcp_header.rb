module Modbus
  class TCPHeader < BinData::Record
    endian :big
    uint16 :transaction
    uint16 :protocol, value: 0
    uint16 :request_length
    uint8 :unit
  end
end
