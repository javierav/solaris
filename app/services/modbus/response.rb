module Modbus
  class Response < BinData::Record
    endian :big
    uint8 :function

    struct :exception, onlyif: -> { function & 0x80 == 0x80 } do
      uint8 :code
    end

    struct :get, onlyif: -> { READ_CODES.include?(function) } do
      uint8 :data_length, value: -> { get.data.bytesize }
      string :data, read_length: -> { get.data_length }
    end

    struct :put, onlyif: -> { WRITE_CODES.include?(function) } do
      uint16 :address
      uint16 :data
    end
  end
end
