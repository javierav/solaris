require "test_helper"

class InverterTest < ActiveSupport::TestCase
  test "read default indicators" do
    with_metrics(metrics_indicators) do
      with_stubbed_protocol do
        with_stubbed_gateway do
          assert_equal(metrics_indicators, Inverter.read)
        end
      end
    end
  end

  test "read metrics indicators" do
    with_metrics(metrics_indicators) do
      with_stubbed_protocol do
        with_stubbed_gateway do
          assert_equal(metrics_indicators, Inverter.read(Inverter::METRICS_INDICATORS))
        end
      end
    end
  end

  test "read metadata indicators" do
    with_metrics(metadata_indicators) do
      with_stubbed_protocol do
        with_stubbed_gateway do
          assert_equal(metadata_indicators, Inverter.read(Inverter::METADATA_INDICATORS))
        end
      end
    end
  end

  def with_metrics(metrics)
    metrics.each do |indicator, value|
      gateway_instance.expect(:read, value, [indicator])
    end

    yield if block_given?

    gateway_instance.verify
  end

  def with_stubbed_protocol(&)
    Protocol.stub(:current, protocol_klass, &)
  end

  def protocol_klass
    @protocol_klass ||= begin
      mock = Minitest::Mock.new
      mock.expect(:new, protocol_instance)
      mock
    end
  end

  def protocol_instance
    @protocol_instance ||= begin
      mock = Minitest::Mock.new
      (Inverter::METRICS_INDICATORS + Inverter::METADATA_INDICATORS).each do |indicator|
        mock.expect(indicator, indicator)
      end
      mock
    end
  end

  def with_stubbed_gateway(&)
    Gateway.stub(:current, gateway_klass, &)
  end

  def gateway_klass
    @gateway_klass ||= begin
      mock = Minitest::Mock.new
      mock.expect(:new, gateway_instance)
      mock
    end
  end

  def gateway_instance
    @gateway_instance ||= begin
      mock = Minitest::Mock.new
      mock.expect(:close, true)
      mock
    end
  end

  def metrics_indicators
    {
      solar_power: 1,
      solar_energy: 2,
      grid_power: 3,
      grid_energy_export: 4,
      grid_energy_import: 5
    }
  end

  def metadata_indicators
    {
      model: "model-test",
      serial_number: "serial-number-test"
    }
  end
end
