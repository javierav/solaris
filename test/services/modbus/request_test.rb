require "test_helper"

module Modbus
  class RequestTest < ActiveSupport::TestCase
    test "request for read register" do
      request = Modbus::Request.new(
        function: 3,
        get: {
          address: 32_080,
          quantity: 2
        }
      )

      assert_equal "\x03\x7d\x50\x00\x02", request.to_binary_s
    end
  end
end
