require "test_helper"

module Modbus
  class AduTest < ActiveSupport::TestCase
    test ".create_request" do
      register = Register.new(address: 32_114, quantity: 2, type: :int32be)
      request = Modbus::ADU.create_request(2, 1, register)

      assert_equal 2, request.header.transaction
      assert_equal 0, request.header.protocol
      assert_equal 1, request.header.unit
      assert_equal 3, request.pdu.function
      assert_equal 32_114, request.pdu.get.address
      assert_equal 2, request.pdu.get.quantity
      assert_equal "\x00\x02\x00\x00\x00\x06\x01\x03\x7d\x72\x00\x02", request.to_binary_s
    end

    test ".parse_response" do
      binary_string = "\x00\x02\x00\x00\x00\x07\x01\x03\x04\x00\x00\x02\x1e"
      response = Modbus::ADU.parse_response(binary_string)

      assert_equal 2, response.header.transaction
      assert_equal 0, response.header.protocol
      assert_equal 7, response.header.request_length
      assert_equal 1, response.header.unit
      assert_equal 3, response.pdu.function
      assert_equal 4, response.pdu.get.data_length
      assert_equal 542, BinData::Int32be.read(response.pdu.get.data).value
      assert_equal binary_string, response.to_binary_s
    end

    test "#to_debug" do
      register = Register.new(address: 32_114, quantity: 2, type: :int32be)
      request = Modbus::ADU.create_request(2, 1, register)

      assert_equal "[00][02][00][00][00][06][01][03][7d][72][00][02]", request.to_debug
    end
  end
end
