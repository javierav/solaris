require "test_helper"

class PVPCTest < ActiveSupport::TestCase
  test "create without import" do
    pvpc = PVPC.new

    assert_not pvpc.save
    assert pvpc.errors.added?(:import, :blank)
  end

  test "create without export" do
    pvpc = PVPC.new

    assert_not pvpc.save
    assert pvpc.errors.added?(:export, :blank)
  end

  test "create with valid attributes" do
    pvpc = PVPC.new(datetime: Time.current, import: 0.1, export: 0.05)

    assert pvpc.save
    assert_equal 2, pvpc.factor
  end
end
