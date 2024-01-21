class Daily < ApplicationRecord
  self.abstract_class = true

  before_validation :compute

  def self.run(date = Date.current.yesterday)
    dailies.map do |klass|
      klass.find_or_initialize_by(date:).tap(&:save)
    end
  end

  private_class_method def self.dailies
    [
      Dailies::EnergyPriceImport,
      Dailies::EnergyPriceExport,
      Dailies::SolarPower
    ]
  end

  private

  def compute
    %i[max maxtime maxhour min mintime minhour sum avg].each do |column|
      send("#{column}=", send("compute_#{column}")) if respond_to?("compute_#{column}")
    end
  end

  def to_hourly(time)
    time.present? ? date.to_time.change(hour: time.hour) : nil
  end
end
