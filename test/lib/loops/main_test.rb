require "test_helper"

module Loops
  class MainTest < ActiveSupport::TestCase
    test "store inverter data" do
      store = Minitest::Mock.new
      store.expect(:set, nil, [{ solar_power: 123 }])

      Inverter.stub(:read, { solar_power: 123 }) do
        Loops::Main.run(store)
        store.verify
      end
    end
  end
end
