module Solaris
  module Charts
    def self.all
      [SolarPower, SolarEnergy, EnergyConsumption, EnergyDistribution, Balance, EnergyCost, Saving]
    end

    def self.for_period(period)
      case period
      when :now
        []
      when :day
        all
      else
        all - [SolarPower]
      end
    end
  end
end
