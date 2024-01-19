module Modbus
  class Register
    attr_reader :address, :quantity, :type, :scale

    def initialize(address:, quantity:, type:, scale: 1)
      @address = address
      @quantity = quantity
      @type = type
      @scale = scale
    end

    def from_binary(binary_string)
      with_scale(deserialize(binary_string))
    end

    private

    def deserialize(binary_string)
      if type == "string"
        # each modbus register hold 16 bits (2 chars of 8 bits each - ASCII), so we need to multiply by 2
        type_class.read(binary_string, read_length: quantity * 2, trim_padding: true).value
      else
        type_class.read(binary_string).value
      end
    end

    def type_class
      "BinData::#{type.camelize}".constantize
    end

    def with_scale(value)
      type == "string" ? value : value / (scale * 1.0)
    end
  end
end
