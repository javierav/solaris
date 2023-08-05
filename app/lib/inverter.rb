class Inverter
  attr_reader :data

  MAPPINGS = {
    inverter_output_power: :solar_power,
    inverter_daily_energy: :solar_energy,
    inverter_temperature: :temperature,
    meter_grid_power: :grid_power,
    meter_positive_active_electricity: :grid_export,
    meter_reverse_active_power: :grid_import
  }.freeze

  delegate(*MAPPINGS.values, to: :data)

  def initialize
    @data = OpenStruct.new(inverter_data) # rubocop:disable Style/OpenStructUse
  end

  private

  def inverter_data
    HuaweiSolar.new(Config.inverter_ip).read(MAPPINGS.keys, keys: true).transform_keys! { |key| MAPPINGS[key] }
  end
end
