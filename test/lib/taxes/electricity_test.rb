require "test_helper"

module Taxes
  class ElectricityTest < ActiveSupport::TestCase
    test "from 2023-01-01 to 2023-12-31" do
      assert_in_delta 0.005, Electricity.for(Date.new(2023, 1, 1))
      assert_in_delta 0.005, Electricity.for(Date.new(2023, 12, 31))
    end

    test "from 2024-01-01 to 2024-03-31" do
      assert_in_delta 0.025, Electricity.for(Date.new(2024, 1, 1))
      assert_in_delta 0.025, Electricity.for(Date.new(2024, 3, 31))
    end

    test "from 2024-04-01 to 2024-06-30" do
      assert_in_delta 0.038, Electricity.for(Date.new(2024, 4, 1))
      assert_in_delta 0.038, Electricity.for(Date.new(2024, 6, 30))
    end
  end
end
