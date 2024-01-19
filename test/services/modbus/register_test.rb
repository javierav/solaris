require "test_helper"

module Modbus
  class RegisterTest < ActiveSupport::TestCase
    test "integer register with default scale" do
      register = Modbus::Register.new(address: 32_080, quantity: 2, type: "int32be")

      assert_equal 542, register.from_binary("\x00\x00\x02\x1e")
    end

    test "integer register with scale 10" do
      register = Modbus::Register.new(address: 32_080, quantity: 2, type: "int32be", scale: 10)

      assert_in_delta 54.2, register.from_binary("\x00\x00\x02\x1e")
    end

    test "string register" do
      register = Modbus::Register.new(address: 30_015, quantity: 10, type: "string")
      binary_string = ["\x53\x55\x4e", "\x00" * 27].join

      assert_equal "SUN", register.from_binary(binary_string)
    end
  end
end
