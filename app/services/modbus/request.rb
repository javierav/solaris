module Modbus
  class Request < BinData::Record
    endian :big
    uint8 :function

    struct :get, onlyif: -> { READ_CODES.include?(function) } do
      uint16 :address
      uint16 :quantity
    end

    struct :put, onlyif: -> { WRITE_CODES.include?(function) } do
      uint16 :address
      uint16 :data
    end
  end
end
