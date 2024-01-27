require "test_helper"

module Taxes
  class ValueAddTest < ActiveSupport::TestCase
    test "when region is pen or bal" do
      %w[1 3].each do |region|
        Region.stub(:current, Region.new(region)) do
          assert_in_delta 0.05, ValueAdd.for(Date.new(2023, 1, 1))
          assert_in_delta 0.05, ValueAdd.for(Date.new(2023, 12, 31))
          assert_in_delta 0.1, ValueAdd.for(Date.new(2024, 1, 1))
        end
      end
    end

    test "when region is can" do
      Region.stub(:current, Region.new("2")) do
        assert_in_delta 0.0, ValueAdd.for(Date.new(2023, 1, 1))
        assert_in_delta 0.0, ValueAdd.for(Date.new(2023, 12, 31))
        assert_in_delta 0.0, ValueAdd.for(Date.new(2024, 1, 1))
      end
    end

    test "when region is ceu or mel" do
      %w[4 5].each do |region|
        Region.stub(:current, Region.new(region)) do
          assert_in_delta 0.01, ValueAdd.for(Date.new(2023, 1, 1))
          assert_in_delta 0.01, ValueAdd.for(Date.new(2023, 12, 31))
          assert_in_delta 0.01, ValueAdd.for(Date.new(2024, 1, 1))
        end
      end
    end
  end
end
