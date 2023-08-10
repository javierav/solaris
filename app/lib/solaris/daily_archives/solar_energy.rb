module Solaris
  module DailyArchives
    class SolarEnergy < Base
      def max
        sum_by_hour.values.max.round(2)
      end

      def maxtime
        date.to_time.change(hour: sum_by_hour.max_by { |a| a[1] }.first)
      end

      def sum
        (archives_array.last.solar_energy - archives_array.first.solar_energy).round(2)
      end

      private

      def archives_array
        @archives_array ||= archives.to_a
      end

      def group_by_hour
        @group_by_hour ||= archives_array.group_by do |archive|
          archive.created_at.hour
        end
      end

      def sum_by_hour
        @sum_by_hour ||= group_by_hour.transform_values do |archives|
          archives.last.solar_energy - archives.first.solar_energy
        end
      end
    end
  end
end
