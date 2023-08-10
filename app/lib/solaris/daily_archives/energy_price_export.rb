module Solaris
  module DailyArchives
    class EnergyPriceExport < Base
      def max
        ::EnergyPrice.by_date(date).maximum(:export)
      end

      def maxtime
        ::EnergyPrice.by_date(date).where(export: max).first.datetime
      end

      def min
        ::EnergyPrice.by_date(date).minimum(:export)
      end

      def mintime
        ::EnergyPrice.by_date(date).where(export: min).first.datetime
      end

      def avg
        ::EnergyPrice.by_date(date).average(:export).round(4)
      end
    end
  end
end
