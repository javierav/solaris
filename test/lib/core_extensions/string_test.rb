require "test_helper"

module CoreExtensions
  class StringTest < ActiveSupport::TestCase
    test "to_boolean" do
      assert "true".to_boolean
      assert "1".to_boolean
      assert_not "false".to_boolean
      assert_not "0".to_boolean
    end
  end
end
