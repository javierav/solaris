class Inverter
  METRICS_INDICATORS = %i[solar_power solar_energy grid_power grid_energy_export grid_energy_import].freeze
  METADATA_INDICATORS = %i[model serial_number].freeze

  def self.read(*indicators)
    instance = new
    instance.read(indicators.flatten.presence || METRICS_INDICATORS)
  ensure
    instance.close
  end

  def initialize
    @gateway = Gateway.current.new
    @protocol = Protocol.current.new
  end

  def read(indicators)
    indicators.index_with do |indicator|
      @gateway.read(@protocol.send(indicator))
    end
  end

  def close
    @gateway.close
  end
end
