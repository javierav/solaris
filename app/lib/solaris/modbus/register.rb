module Solaris
  module Modbus
    class Register
      attr_reader :value

      def self.address
        raise NotImplementedError
      end

      def self.quantity
        raise NotImplementedError
      end

      def self.scale
        raise NotImplementedError
      end

      def self.deserialize(binary_string)
        raise NotImplementedError
      end

      def self.from_binary(binary_string)
        new(deserialize(binary_string)).value
      end

      def initialize(value)
        @value = value / (self.class.scale * 1.0)
      end
    end
  end
end
