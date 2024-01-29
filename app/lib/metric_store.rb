class MetricStore
  def initialize
    @mutex = Mutex.new
    reset
  end

  def set(metrics)
    @mutex.synchronize do
      @metrics.each_key do |key|
        @metrics[key] << metrics[key] if metrics.key?(key)
      end
    end
  end

  def get
    @mutex.synchronize do
      @metrics.to_h { |key, values| [key, send("reduce_#{key}", values)] }.tap { reset }
    end
  end

  private

  def reset
    @metrics = { solar_power: [], solar_energy: [], grid_power: [], grid_energy_import: [], grid_energy_export: [] }
  end

  def reduce_solar_power(values)
    values.median || 0
  end

  def reduce_solar_energy(values)
    values.max || 0.0
  end

  def reduce_grid_power(values)
    values.median || 0
  end

  def reduce_grid_energy_import(values)
    values.max || 0.0
  end

  def reduce_grid_energy_export(values)
    values.max || 0.0
  end
end
