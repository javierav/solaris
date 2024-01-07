module Solaris
  module DailyArchives
    class SolarPower < Base
      def max
        _max.round(2)
      end

      def maxtime
        archives.where(solar_power: _max).first.created_at
      end

      def _max
        archives.maximum(:solar_power)
      end
    end
  end
end
