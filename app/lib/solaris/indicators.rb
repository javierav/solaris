module Solaris
  module Indicators
    def self.all
      [
        SolarEnergy
      ]
    end

    def self.for_period(period)
      case period
      when :day
        all
      else
        all
      end
    end
  end
end
