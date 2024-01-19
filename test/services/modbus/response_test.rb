require "test_helper"

module Modbus
  class ResponseTest < ActiveSupport::TestCase
    test "get response" do
      response = Modbus::Response.read("\x03\x04\x00\x04\x76\xcf")

      assert_equal 3, response.function
      assert_equal 4, response.get.data_length
      assert_equal 292_559, BinData::Int32be.read(response.get.data).value
    end

    test "get response with exception" do
      response = Modbus::Response.read("\x83\x02")

      assert_equal 131, response.function
      assert_equal 2, response.exception.code
    end
  end
end
