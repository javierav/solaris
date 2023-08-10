module Solaris
  module DailyArchives
    class EnergyPriceImport < Base
      def max
        ::EnergyPrice.by_date(date).maximum(:import)
      end

      def maxtime
        ::EnergyPrice.by_date(date).where(import: max).first.datetime
      end

      def min
        ::EnergyPrice.by_date(date).minimum(:import)
      end

      def mintime
        ::EnergyPrice.by_date(date).where(import: min).first.datetime
      end

      def avg
        ::EnergyPrice.by_date(date).average(:import).round(4)
      end
    end
  end
end
