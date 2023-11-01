require "test_helper"

class SettingTest < ActiveSupport::TestCase
  test "should return default timezone" do
    assert_equal "Europe/Madrid", Setting.new.timezone
  end

  test "should return default loop interval" do
    assert_equal 30, Setting.new.loop_interval
  end

  test "should validate numericality of loop_interval" do
    setting = Setting.new(loop_interval: "foo")

    assert_not setting.save
    assert setting.errors.added?(:loop_interval, :not_a_number, value: "foo")
  end

  test "should validate numericality of loop_interval greater than 0" do
    setting = Setting.new(loop_interval: 0)

    assert_not setting.save
    assert setting.errors.added?(:loop_interval, :greater_than, count: 0, value: 0)
  end

  test "should return default archive interval" do
    assert_equal 60, Setting.new.archive_interval
  end

  test "should validate numericality of archive_interval" do
    setting = Setting.new(archive_interval: "foo")

    assert_not setting.save
    assert setting.errors.added?(:archive_interval, :not_a_number, value: "foo")
  end

  test "should validate numericality of archive_interval greater than 0" do
    setting = Setting.new(archive_interval: 0)

    assert_not setting.save
    assert setting.errors.added?(:archive_interval, :greater_than, count: 0, value: 0)
  end

  test "should validate presence of energy_price_at" do
    setting = Setting.new(energy_price: "esios")

    assert_not setting.save
    assert setting.errors.added?(:energy_price_at, :blank)
  end

  test "should validate presence of esios_api_key" do
    setting = Setting.new(energy_price: "esios")

    assert_not setting.save
    assert setting.errors.added?(:esios_api_key, :blank)
  end

  test "should validate presence of esios_zone" do
    setting = Setting.new(energy_price: "esios")

    assert_not setting.save
    assert setting.errors.added?(:esios_zone, :blank)
  end

  test "should validate presence of esios_country" do
    setting = Setting.new(energy_price: "esios")

    assert_not setting.save
    assert setting.errors.added?(:esios_country, :blank)
  end

  test "should validate presence of huawei_ip" do
    setting = Setting.new(inverter: "huawei")

    assert_not setting.save
    assert setting.errors.added?(:huawei_ip, :blank)
  end

  test "should validate presence of huawei_port" do
    setting = Setting.new(inverter: "huawei")

    assert_not setting.save
    assert setting.errors.added?(:huawei_port, :blank)
  end

  test "should return instance" do
    assert_equal Setting.first_or_create, Setting.instance
  end

  test "should return same instance" do
    assert_equal Setting.instance, Setting.instance
  end
end
