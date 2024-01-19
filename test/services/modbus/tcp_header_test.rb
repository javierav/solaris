require "test_helper"

module Modbus
  class TCPHeaderTest < ActiveSupport::TestCase
    test "read from hex string" do
      tcp_header = Modbus::TCPHeader.read("\x00\x01\x00\x00\x00\x06\x01")

      assert_equal 1, tcp_header[:transaction]
      assert_equal 0, tcp_header[:protocol]
      assert_equal 6, tcp_header[:request_length]
      assert_equal 1, tcp_header[:unit]
    end

    test "write to hex string" do
      tcp_header = Modbus::TCPHeader.new(
        transaction: 1,
        protocol: 0,
        request_length: 6,
        unit: 1
      )

      assert_equal "\x00\x01\x00\x00\x00\x06\x01", tcp_header.to_binary_s
    end
  end
end
