module Solaris
  module Charts
    class SolarPower < Base
      def chart_type
        "line"
      end

      def archive_collection
        Archive.where(created_at: period).select(:created_at, :solar_power)
      end

      def collection_for_day
      end

      def collection_for_week
      end

      def collection_for_month
      end

      def collection_for_year
      end

      def collection_for_all
      end

      def collection_for_custom
      end
    end
  end
end
